# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal fork of [JohnnyMorganz/luau-lsp](https://github.com/JohnnyMorganz/luau-lsp), shipped as the VS Code extension "Luau Exploit LSP" (`luau-exploit-lsp`). It adds executor/exploit globals (closures, debug, Drawing, filtergc, Luarmor macros, etc.) and custom completions on top of upstream. Most upstream code is untouched; the custom work is small and spread across a few places (see "Fork-specific customizations").

- `server/`: the C++ language server (CMake, Visual Studio 18 2026 generator, built in `server/build`). `server/luau` is the Roblox/luau git submodule.
- `extension/`: the VS Code client (TypeScript, bundled with esbuild into `dist/extension.js`). It launches `extension/bin/server.exe`.

## Build and install

The full loop is in the `rebuild steps` file at the repo root. Run these in a shell that has the VS developer environment:

```bat
:: server + extension (build, copy binary, package, install)
cd server\build && cmake --build . --target Luau.LanguageServer.CLI --config Release && copy /Y "server\build\Release\luau-lsp.exe" "extension\bin\server.exe" && cd ..\..\extension && npx vsce package && code --install-extension luau-exploit-lsp-1.0.0.vsix --force

:: extension only
cd extension && npx vsce package && code --install-extension luau-exploit-lsp-1.0.0.vsix --force
```

After installing, run "Developer: Reload Window" in VS Code to pick up the change. A server change does nothing until the binary is copied to `extension/bin/server.exe` and the extension is repackaged.

Extension-only checks, from `extension/`: `npm run check-types`, `npm run lint`, `npm run check:format`.

## Tests

The server tests use doctest, in the `Luau.LanguageServer.Test` target (`server/tests/*.test.cpp`; the fixtures are `Fixture.h` and `TestClient.h`).

```bat
cd server\build && cmake --build . --target Luau.LanguageServer.Test --config Release
server\build\Release\Luau.LanguageServer.Test.exe --test-case="function_autocomplete_has_documentation"
server\build\Release\Luau.LanguageServer.Test.exe --source-file=*Autocomplete.test.cpp
```

## Architecture

- **Transport → LanguageServer → WorkspaceFolder.** `main.cpp` runs JSON-RPC over stdio (`JsonRpc.cpp`, `transport/`). `LanguageServer.cpp` handles the LSP lifecycle, advertises capabilities (including completion trigger characters in `getServerCapabilities`), and routes each request to the `WorkspaceFolder` (`Workspace.cpp`) that owns the file. Each workspace folder holds a `Luau::Frontend`, which does the type checking.
- **Operations.** Each LSP feature is a `WorkspaceFolder::<feature>` method in `src/operations/<Feature>.cpp` (Completion, Hover, Diagnostics, etc.). Completion calls `Luau::autocomplete`/fragment autocomplete with a string-completion callback, then converts the entries to `lsp::CompletionItem`s.
- **Platform layer.** `src/platform/LSPPlatform.cpp` is the base class. `src/platform/roblox/` overrides hooks such as `mutateRegisteredDefinitions` (`RobloxLuauExt.cpp`, which attaches tags and magic functions to global types after the definitions load) and `completionCallback`/`handleSortText` (`RobloxCompletion.cpp`, which returns completions for tagged string arguments).
- **Definitions.** `extension/src/extension.ts` passes the server `--definitions:@custom=typedefs/custom.d.luau` and `--docs=typedefs/custom.docs.json`, alongside the downloaded Roblox API types. New exploit globals go in `custom.d.luau` as `declare` statements.

## Fork-specific customizations

- **Custom string-argument completions.** `server/src/include/LSP/StringArgCompletions.hpp` maps a global function name to its allowed string values. `RobloxLuauExt.cpp` tags each listed function with `StringArg:<name>`, and `RobloxCompletion.cpp` answers that tag. To add one, add an entry to the table; the function must also be declared in `custom.d.luau`.
- **`Drawing.new` completions.** These use the `DrawingTypes` tag, wired the same way but hardcoded in the same two files.
- **`end` autocompletion indent and `additionalTextEdits` handling.** Both are in `operations/Completion.cpp`.

## Gotchas

- `server/build/` is tracked in git, so building changes `.tlog` files. Don't stage these unless asked.
- `LSP_WERROR` is ON by default, so compiler warnings fail the build.
