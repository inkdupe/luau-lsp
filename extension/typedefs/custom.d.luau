-- <TYPES> --

type anyFunc = (...any) -> ...any
type table = {[any]: any}

-- <LUARMOR> --

declare LPH_NO_VIRTUALIZE: (func: anyFunc) -> anyFunc
declare LRM_SEND_WEBHOOK: (url: string, payload: table) -> ()
declare LRM_SANITIZE: (value: any, regex: string) -> string
declare LPH_OBFUSCATED: boolean
declare LRM_ScriptVersion: string

-- <SCRIPTING> --

-- CLOSURES --

declare checkcaller: () -> boolean
declare clonefunction: (func: anyFunc) -> anyFunc
declare getfunctionhash: (func: anyFunc) -> string
declare hookfunction: (target: anyFunc, hook: anyFunc) -> anyFunc
declare hookmetamethod: (object: any, metamethod: string, hook: anyFunc) -> anyFunc
declare hookproto: (proto: anyFunc, hook: anyFunc) -> ()
declare iscclosure: (func: anyFunc) -> boolean
declare isexecutorclosure: (func: anyFunc) -> boolean
declare checkclosure: (func: anyFunc) -> boolean
declare isourclosure: (func: anyFunc) -> boolean
declare isfunctionhooked: (func: anyFunc) -> boolean
declare islclosure: (func: anyFunc) -> boolean
declare isnewcclosure: (func: anyFunc) -> boolean
declare iscustomcclosure: (func: anyFunc) -> boolean
declare isprotohooked: (proto: anyFunc) -> boolean
declare newcclosure: (func: anyFunc, debugname: string?) -> anyFunc
declare newlclosure: (func: anyFunc, debugname: string?) -> anyFunc
declare restorefunction: (func: anyFunc) -> ()
declare restorefunc: (func: anyFunc) -> ()
declare restoreproto: (proto: anyFunc) -> ()
declare setstackhidden: (funcOrLevel: anyFunc | number, hidden: boolean) -> ()

-- DEBUG --

declare debug: {
    info: (<R...>(thread, number, string) -> R...) & (<R...>(number, string) -> R...) & (<A..., R1..., R2...>((A...) -> R1..., string) -> R2...),
    traceback: ((string?, number?) -> string) & ((thread, string?, number?) -> string),
    profilebegin: (label: string) -> (),
    profileend: () -> (),
    getmemorycategory: () -> string,
    setmemorycategory: (tag: string) -> (),
    resetmemorycategory: () -> (),

    getcallstack: (thread: thread?) -> { { func: anyFunc, currentline: number? } },
    getconstant: (func: anyFunc | number, index: number) -> any,
    getstack: ((level: number, index: number?) -> any) & ((thread: thread, level: number, index: number?) -> any),
    setstack: ((level: number, index: number, value: any) -> ()) & ((thread: thread, level: number, index: number, value: any) -> ()),
    getconstants: (func: anyFunc | number) -> { any },
    getinfo: (func_or_level: anyFunc | number) -> table,
    getproto: (func: anyFunc | number, index: number, activated: boolean?) -> anyFunc | { anyFunc },
    getprotos: (func: anyFunc | number) -> { anyFunc },
    getupvalue: (func: anyFunc | number, index: number) -> any,
    getupvalues: (func: anyFunc | number) -> { any },
    setconstant: (func: anyFunc | number, index: number, value: any) -> anyFunc,
    setinfo: (func_or_level: anyFunc | number, info: table) -> (),
    setupvalue: (func: anyFunc | number, index: number, value: any) -> (),
    validlevel: (level: number, thread: thread?) -> boolean
}

-- REFLECTION --

declare gethiddenproperties: (object: Object) -> table
declare gethiddenproperty: (object: Object, property: string) -> (any?, boolean?)
declare getproperties: (object: Object) -> table
declare getthreadidentity: () -> number
declare isnetworkowner: (part: BasePart) -> boolean
declare isscriptable: (object: Object, property: string) -> boolean
declare sethiddenproperty: (object: Object, property: string, value: any) -> boolean?
declare setscriptable: (object: Object, property: string, scriptable: boolean) -> boolean
declare getsimulationradius: () -> number
declare setsimulationradius: (radius: number) -> ()
declare setthreadidentity: (identity: number) -> ()

-- METATABLE -- https://docs.voltbz.net/docs/metatable

declare getnamecallmethod: () -> string?
declare getrawmetatable: (object: any) -> table?
declare isreadonly: (table: table) -> boolean
declare iswritable: (table: table) -> boolean
declare makereadonly: (table: table) -> ()
declare makewritable: (table: table) -> ()
declare setnamecallmethod: (method: string) -> ()
declare setrawmetatable: <T>(object: T, metatable: table?) -> T
declare setreadonly: (table: table, readonly: boolean) -> ()

-- ENVIRONMENT --

declare filtergc: (type: "function" | "table", options: table, returnOne: boolean?) -> (any? | {any})
declare getallthreads: () -> {thread}
declare getgc: (includeTables: boolean?) -> table
declare getgenv: () -> table
declare getreg: () -> table
declare getrenv: () -> table
declare gettenv: (thread: thread?) -> table?

-- SCRIPTS --

declare decompile: (source: LuaSourceContainer | string) -> string | nil
declare getcallingscript: () -> BaseScript | ModuleScript | nil
declare getfunctionbytecode: (func: anyFunc) -> string
declare getloadedmodules: () -> {ModuleScript}
declare getmodules: () -> {ModuleScript}
declare getrunningscripts: () -> {LuaSourceContainer}
declare getscriptbytecode: (script: CoreScript | LocalScript | ModuleScript | Script) -> string
declare dumpstring: (script: CoreScript | LocalScript | ModuleScript | Script) -> string
declare getscriptclosure: (script: LocalScript | ModuleScript | Script) -> anyFunc | string
declare getscriptfromthread: (thread: thread) -> BaseScript | ModuleScript | nil
declare getscripthash: (script: CoreScript | LocalScript | ModuleScript | Script) -> string
declare getscripts: () -> {BaseScript | ModuleScript}
declare getscriptthread: (script: LocalScript | ModuleScript | Script) -> thread
declare getsenv: (script: LocalScript | ModuleScript | Script) -> table
declare getmenv: (moduleScript: ModuleScript) -> table
declare isexecutorthread: (thread: thread?) -> boolean
-- declare loadstring: (code: string, chunkname: string?) -> (anyFunc?, string?)

-- OTH --

declare OTH: {
    get_root_callback: () -> thread?,
    get_original_thread: () -> thread?,
    hook: (target: anyFunc, hook: anyFunc) -> anyFunc,
    is_hook_thread: () -> boolean,
    unhook: (target: anyFunc) -> boolean
}

-- INSTANCES --

declare cloneref: (instance: Instance) -> Instance
declare clonereference: (instance: Instance) -> Instance
declare compareinstances: (a: Instance, b: Instance) -> boolean
declare fireclickdetector: (detector: ClickDetector, distance: number?, event: string?) -> ()
declare fireproximityprompt: (prompt: ProximityPrompt) -> ()
declare firetouchinterest: (part: BasePart, target: BasePart, toggle: boolean | number) -> ()
declare getcallbackmember: (object: Object, property: string, returnRaw: boolean?) -> any?
declare getcallbackvalue: (object: Object, property: string, returnRaw: boolean?) -> any?
declare gethui: () -> BasePlayerGui
declare getinstancecache: () -> table
declare getinstances: () -> table
declare getnilinstances: () -> table
declare getrendersteppedlist: () -> table

-- CACHE --

declare cache: {
    invalidate: (instance: Instance) -> (),
    iscached: (instance: Instance) -> boolean,
    replace: (instance: Instance, replacement: Instance) -> ()
}

-- SIGNALS --

type Connection = {
    Enabled: boolean,
    Disabled: boolean,
    ForeignState: boolean,
    LuaConnection: boolean,
    Function: anyFunc?,
    Thread: thread?,
    Fire: (self: Connection, ...any) -> (),
    Defer: (self: Connection, ...any) -> (),
    Disconnect: (self: Connection) -> (),
    Disable: (self: Connection) -> (),
    Enable: (self: Connection) -> (),
}

declare cansignalreplicate: (signal: RBXScriptSignal) -> boolean
declare firesignal: (signal: RBXScriptSignal, ...any) -> ()
declare getconnections: (signal: RBXScriptSignal) -> {Connection}
declare getsignalarguments: (signal: RBXScriptSignal) -> table
declare getsignalargumentsinfo: (signal: RBXScriptSignal) -> table
declare getsignalwhitelist: () -> table
declare replicatesignal: (signal: RBXScriptSignal, ...any) -> ()

-- ACTORS --

declare create_comm_channel: () -> (number, any)
declare get_comm_channel: (id: number) -> BindableEvent
declare get_current_actor: () -> Actor?
declare getactors: () -> {Actor}
declare getactorstates: () -> {any}
declare getgamestate: () -> any?
declare getluastate: (actor_or_script: (Actor | LocalScript | ModuleScript | Script)?) -> any?
declare isparallel: () -> boolean
declare on_actor_state_created: RBXScriptSignal
declare run_on_actor: (actor: Actor, script: string, ...any) -> ()

-- FILESYSTEM --

declare appendfile: (path: string, data: string) -> ()
declare delfile: (path: string) -> ()
declare delfolder: (path: string) -> ()
declare dofile: (path: string) -> ()
declare getcustomasset: (path: string) -> string
declare isfile: (path: string) -> boolean
declare isfolder: (path: string) -> boolean
declare listfiles: (path: string) -> table
declare loadfile: (path: string) -> (anyFunc?, string?)
declare makefolder: (path: string) -> ()
declare readfile: (path: string) -> string
declare writefile: (path: string, data: string) -> ()

-- INPUT --

declare iswindowactive: () -> boolean
declare keyclick: (keycode: number) -> ()
declare keypress: (keycode: number) -> ()
declare keyrelease: (keycode: number) -> ()
declare mouse1click: () -> ()
declare mouse1press: () -> ()
declare mouse1release: () -> ()
declare mouse2click: () -> ()
declare mouse2press: () -> ()
declare mouse2release: () -> ()
declare mousemoveabs: (x: number, y: number) -> ()
declare mousemoverel: (dx: number, dy: number) -> ()
declare mousescroll: (delta: number) -> ()

-- CONSOLE --

declare rconsoleclear: () -> ()
declare rconsoleerr: (data: any, async: boolean?) -> ()
declare rconsolehidden: () -> boolean
declare rconsolehide: () -> ()
declare rconsoleinfo: (data: any, async: boolean?) -> ()
declare rconsoleinput: () -> string
declare rconsolename: (title: string) -> ()
declare rconsoleprint: (data: any, async: boolean?, escape: boolean?) -> ()
declare rconsoleshow: () -> ()
declare rconsoletoggle: () -> ()
declare rconsoletop: (shouldBeTop: boolean) -> ()
declare rconsolewarn: (data: any, async: boolean?) -> ()

-- CRPYT --

declare crypt: {
    decrypt: (data: string, key: string, iv: string, mode: string?) -> string,
    encrypt: (data: string, key: string, iv: string?, mode: string?) -> (string, string),
    generatebytes: (length: number) -> string,
    generatekey: () -> string,
    hash: (data: string, algorithm: string, key: string?) -> string,
    hmac: (key: string, data: string, algorithm: string) -> string,
    random: (length: number) -> string,
}

-- ENCODING ---

declare base64decode: (data: string) -> string
declare base64encode: (data: string) -> string
declare lz4compress: (data: string) -> string
declare lz4decompress: (data: string, size: number) -> string

-- MISCELLANEOUS --

type requestOptions = {
    Url: string,
    Method: string?,
    Headers: { [string]: string }?,
    Body: string?,
}

type requestResponse = {
    Success: boolean,
    StatusCode: number,
    StatusMessage: string,
    Headers: { [string]: string },
    Body: string,
}

type SaveInstanceOptions = {
    FilePath: string,
    IgnoreArchivable: boolean,
    SavePlayerCharacters: boolean,
    SavePlayers: boolean,
    DisableCompression: boolean,
    DecompileScripts: boolean,
    SaveNonCreatable: boolean,
    SaveNilInstances: boolean,
    CopyToClipboard: boolean,
    IgnoreList: { Instance },
    DecompilerOptions: table,
}

declare clearqueueonteleport: () -> ()
declare get_process_identifier: () -> number
declare getfflag: (name: string) -> string
declare getfpscap: () -> number
declare gethwid: () -> string
declare identifyexecutor: () -> (string, string)
declare messagebox: (text: string, caption: string, flags: number) -> number
declare queueonteleport: (script: string) -> ()
declare request: (options: requestOptions) -> requestResponse
declare saveinstance: (root: Instance | { Instance }, options: SaveInstanceOptions?) -> ()
declare saveplace: (options: SaveInstanceOptions?) -> ()
declare setclipboard: (data: any) -> ()
declare setfflag: (name: string, value: string) -> ()
declare setfpscap: (fps: number) -> ()
declare setrbxclipboard: (data: any) -> ()

-- DRAWING --

type DrawingObj = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
}

export type Line = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    From: Vector2,
    To: Vector2,
    Thickness: number,
}

export type Text = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    Text: string,
    Size: number,
    Position: Vector2,
    Center: boolean,
    Outline: boolean,
    OutlineColor: Color3,
    Font: number,
    TextBounds: Vector2,
}

export type Square = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    Size: Vector2,
    Position: Vector2,
    Thickness: number,
    Filled: boolean,
}

export type Circle = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    Radius: number,
    Position: Vector2,
    Thickness: number,
    NumSides: number,
    Filled: boolean,
}

export type Triangle = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    PointA: Vector2,
    PointB: Vector2,
    PointC: Vector2,
    Thickness: number,
    Filled: boolean,
}

export type Quad = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    PointA: Vector2,
    PointB: Vector2,
    PointC: Vector2,
    PointD: Vector2,
    Thickness: number,
    Filled: boolean,
}

export type Image = {
    Visible: boolean,
    ZIndex: number,
    Transparency: number,
    Color: Color3,
    Remove: (self: any) -> (),
    Destroy: (self: any) -> (),
    Data: string,
    Size: Vector2,
    Position: Vector2,
    Rounding: number,
}

declare Drawing: {
    new: (("Line") -> Line)
        & (("Text") -> Text)
        & (("Square") -> Square)
        & (("Circle") -> Circle)
        & (("Triangle") -> Triangle)
        & (("Quad") -> Quad)
        & (("Image") -> Image)
        & ((kind: "Line" | "Text" | "Square" | "Circle" | "Triangle" | "Quad" | "Image") -> DrawingObj),
    Fonts: {
        UI: number,
        System: number,
        Plex: number,
        Monospace: number,
    },
}

declare cleardrawcache: () -> ()
declare getrenderproperty: (drawing: DrawingObj, property: string) -> any
declare isrenderobj: (object: any) -> boolean
declare setrenderproperty: (drawing: DrawingObj, property: string, value: any) -> ()

-- WEBSOCKET --

type WebSocketCloseSignal = {
    Connect: (self: WebSocketCloseSignal, callback: () -> ()) -> Connection,
}

type WebSocketMessageSignal = {
    Connect: (self: WebSocketMessageSignal, callback: (message: string, isBinary: boolean) -> ()) -> Connection,
}

type WebSocketClient = {
    OnClose: WebSocketCloseSignal,
    OnMessage: WebSocketMessageSignal,
    Send: (self: WebSocketClient, message: string, isBinary: boolean?) -> (),
    Close: (self: WebSocketClient) -> (),
}

declare WebSocket: {
    Connect: (url: string) -> WebSocketClient,
}