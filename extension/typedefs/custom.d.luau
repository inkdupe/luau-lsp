-- <DRAWING> --

type DrawingBase = {
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
        & ((kind: "Line" | "Text" | "Square" | "Circle" | "Triangle" | "Quad" | "Image") -> DrawingBase),
    Fonts: {
        UI: number,
        System: number,
        Plex: number,
        Monospace: number,
    },
}

declare function cleardrawcache(): ()
declare function getrenderproperty(object: any, property: any): any
declare function isrenderobj(object: any): boolean
declare function setrenderproperty(object: any, property: any, value: any): ()

-- </DRAWING> --

type anyFunc = (...any) -> ...any
type anyTable = { [any]: any }

-- <LUARMOR> --

declare LPH_NO_VIRTUALIZE: (func: anyFunc) -> anyFunc
declare LRM_SEND_WEBHOOK: (url: string, payload: anyTable) -> ()
declare LRM_SANITIZE: (value: any, regex: string) -> string
declare LPH_OBFUSCATED: string
declare LRM_ScriptVersion: string

-- </LUARMOR> --

-- REGEX: (?<=\S)\

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
    getinfo: (func_or_level: anyFunc | number) -> anyTable,
    getproto: (func: anyFunc | number, index: number, activated: boolean?) -> anyFunc | { anyFunc },
    getprotos: (func: anyFunc | number) -> { anyFunc },
    getupvalue: (func: anyFunc | number, index: number) -> any,
    getupvalues: (func: anyFunc | number) -> { any },
    setconstant: (func: anyFunc | number, index: number, value: any) -> anyFunc,
    setinfo: (func_or_level: anyFunc | number, info: anyTable) -> (),
    setupvalue: (func: anyFunc | number, index: number, value: any) -> (),
    validlevel: (level: number, thread: thread?) -> boolean
}

-- REFLECTION --

declare gethiddenproperties: (object: Object) -> anyTable
declare gethiddenproperty: (object: Object, property: string) -> (any?, boolean?)
declare getproperties: (object: Object) -> anyTable
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
declare getrawmetatable: (object: any) -> anyTable?
declare isreadonly: (table: anyTable) -> boolean
declare iswritable: (table: anyTable) -> boolean
declare makereadonly: (table: anyTable) -> ()
declare makewritable: (table: anyTable) -> ()
declare setnamecallmethod: (method: string) -> ()
declare setrawmetatable: <T>(object: T, metatable: anyTable?) -> T
declare setreadonly: (table: anyTable, readonly: boolean) -> ()

-- ENVIRONMENT --

declare filtergc: (type: "function" | "table", options: anyTable, returnOne: boolean?) -> (any? | {any})
declare getallthreads: () -> {thread}
declare getgc: (includeTables: boolean?) -> anyTable
declare getgenv: () -> anyTable
declare getreg: () -> anyTable
declare getrenv: () -> anyTable
declare gettenv: (thread: thread?) -> anyTable?

-- SCRIPTS --

declare decompile: (source: LuaSourceContainer | string) -> string | nil
declare getcallingscript: () -> BaseScript | ModuleScript | nil
declare getfunctionbytecode: (func: anyFunc) -> string
declare getloadedmodules: () -> {ModuleScript}
declare getmodules: () -> {ModuleScript}
declare getrunningscripts: () -> {LuaSourceContainer}
declare getscriptbytecode: (script: CoreScript | LocalScript | ModuleScript | Script) -> string
declare getscriptclosure: (script: LocalScript | ModuleScript | Script) -> anyFunc | string
declare getscriptfromthread: (thread: thread) -> BaseScript | ModuleScript | nil
declare getscripthash: (script: CoreScript | LocalScript | ModuleScript | Script) -> string
declare getscripts: () -> {BaseScript | ModuleScript}
declare getscriptthread: (script: LocalScript | ModuleScript | Script) -> thread
declare getsenv: (script: LocalScript | ModuleScript | Script) -> anyTable
declare getmenv: (moduleScript: LocalScript | ModuleScript | Script) -> anyTable
declare isexecutorthread: (thread: thread?) -> boolean
-- declare loadstring: (code: string, chunkname: string?) -> (anyFunc?, string?)

-- OTH --

declare debug: {
    get_root_callback: () -> thread?,
    get_original_thread: () -> thread?,
    hook: (target: anyFunc, hook: anyFunc) -> anyFunc,
    is_hook_thread: () -> boolean,
    unhook: (target: anyFunc) -> boolean
}

-- INSTANCES --

declare cloneref: (instance: Instance) -> Instance
declare compareinstances: (a: Instance, b: Instance) -> boolean
declare fireclickdetector: (detector: ClickDetector, distance: number?, event: string?) -> ()
declare fireproximityprompt: (prompt: ProximityPrompt) -> ()
declare firetouchinterest: (part: BasePart, target: BasePart, toggle: boolean | number) -> ()
declare getcallbackmember: (object: Object, property: string, returnRaw: boolean?) -> any?
declare getcallbackvalue: (object: Object, property: string, returnRaw: boolean?) -> any?
declare gethui: () -> BasePlayerGui
declare getinstancecache: () -> anyTable
declare getinstances: () -> anyTable
declare getnilinstances: () -> anyTable
declare getrendersteppedlist: () -> anyTable


-- </FUNCTIONS> --

--[[
declare gethiddenproperty: (...any) -> ...any
declare sethiddenproperty: (...any) -> ...any

declare iscustomcclosure: (func: anyFunc) -> boolean

declare identifyexecutor: (...any) -> ...any
declare gethui: (...any) -> ...any
declare request: (...any) -> ...any
declare clonereference: (...any) -> ...any
declare cloneref: (...any) -> ...any
declare getgenv: (...any) -> ...any
declare getcustomasset: (...any) -> ...any
declare getrenv: (...any) -> ...any
declare getreg: (...any) -> ...any
declare filtergc: (...any) -> ...any
declare getgc: (...any) -> ...any
declare getinstances: (...any) -> ...any
declare getnilinstances: (...any) -> ...any
declare getconnections: (...any) -> ...any
declare firesignal: (...any) -> ...any
declare fireclickdetector: (...any) -> ...any
declare fireproximityprompt: (...any) -> ...any
declare firetouchinterest: (...any) -> ...any
declare isnetworkowner: (...any) -> ...any
declare setsimulationradius: (...any) -> ...any
declare getsenv: (...any) -> ...any
declare getcallingscript: (...any) -> ...any
declare getscripthash: (...any) -> ...any
declare getrawmetatable: (...any) -> ...any
declare setrawmetatable: (...any) -> ...any
declare setreadonly: (...any) -> ...any
declare isreadonly: (...any) -> ...any
declare iswindowactive: (...any) -> ...any
declare keypress: (...any) -> ...any
declare keyrelease: (...any) -> ...any
declare mouse1click: (...any) -> ...any
declare mouse1press: (...any) -> ...any
declare mouse1release: (...any) -> ...any
declare mouse2click: (...any) -> ...any
declare mouse2press: (...any) -> ...any
declare mouse2release: (...any) -> ...any
declare mousescroll: (...any) -> ...any
declare mousemoverel: (...any) -> ...any
declare mousemoveabs: (...any) -> ...any
declare loadstring: (...any) -> ...any
declare dumpstring: (...any) -> ...any
declare rconsoleprint: (...any) -> ...any
declare rconsoleinfo: (...any) -> ...any
declare rconsolewarn: (...any) -> ...any
declare rconsoleerr: (...any) -> ...any
declare rconsoleclear: (...any) -> ...any
declare rconsolename: (...any) -> ...any
declare rconsoleinput: (...any) -> ...any
declare printconsole: (...any) -> ...any
declare readfile: (...any) -> ...any
declare writefile: (...any) -> ...any
declare appendfile: (...any) -> ...any
declare loadfile: (...any) -> ...any
declare listfiles: (...any) -> ...any
declare isfile: (...any) -> ...any
declare isfolder: (...any) -> ...any
declare makefolder: (...any) -> ...any
declare delfolder: (...any) -> ...any
declare delfile: (...any) -> ...any
declare setclipboard: (...any) -> ...any
declare setfflag: (...any) -> ...any
declare getnamecallmethod: (...any) -> ...any
declare setnamecallmethod: (...any) -> ...any
declare getsynasset: (...any) -> ...any
declare getspecialinfo: (...any) -> ...any
declare saveinstance: (...any) -> ...any
declare messagebox: (...any) -> ...any
]]