import * as vscode from "vscode";

const API_DOCS = "https://luau-lsp.pages.dev/api-docs/en-us.json";
const LUAU_API_DOCS = "https://luau-lsp.pages.dev/api-docs/luau-en-us.json";

const globalTypesEndpointForSecurityLevel = (securityLevel: string) => {
  return `https://luau-lsp.pages.dev/type-definitions/globalTypes.${securityLevel}.d.luau`;
};

const globalTypesUri = (
  context: vscode.ExtensionContext,
  securityLevel: string,
  mode: "Prod" | "Debug",
) => {
  if (mode === "Prod") {
    return vscode.Uri.joinPath(
      context.globalStorageUri,
      `globalTypes.${securityLevel}.d.luau`,
    );
  } else {
    return vscode.Uri.joinPath(
      context.extensionUri,
      "..",
      "server",
      `scripts/globalTypes.${securityLevel}.d.luau`,
    );
  }
};

const apiDocsUri = (context: vscode.ExtensionContext) => {
  return vscode.Uri.joinPath(context.globalStorageUri, "api-docs.json");
};

const luauApiDocsUri = (context: vscode.ExtensionContext) => {
  return vscode.Uri.joinPath(context.globalStorageUri, "luau-api-docs.json");
};

export const preLanguageServerStart = async (
  context: vscode.ExtensionContext,
) => {
  // Load roblox type definitions
  const typesConfig = vscode.workspace.getConfiguration("luau-lsp.types");
  const platformConfig = vscode.workspace.getConfiguration("luau-lsp.platform");

  // TODO: Cleanup when deprecated luau-lsp.types.roblox is deleted
  // We need to respect the new setting as well as the old setting. We check for "&&" since they are on by default
  if (
    platformConfig.get<string>("type") === "roblox" &&
    typesConfig.get<boolean>("roblox")
  ) {
    const securityLevel =
      typesConfig.get<string>("robloxSecurityLevel") ?? "PluginSecurity";

    return {
      definitions: {
        ["@roblox"]: {
          url: globalTypesEndpointForSecurityLevel(securityLevel),
          outputUri: globalTypesUri(context, securityLevel, "Prod"),
        },
      },
      documentation: [{ url: API_DOCS, outputUri: apiDocsUri(context) }],
    };
  } else {
    return {
      definitions: undefined,
      documentation: [
        { url: LUAU_API_DOCS, outputUri: luauApiDocsUri(context) },
      ],
    };
  }
};
