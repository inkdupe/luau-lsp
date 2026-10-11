declare Drawing: {
    new: (...any) -> any
}

declare debug: {
    getupvalue: (...any) -> any,
    setupvalue: (...any) -> any,
    getupvalues: (...any) -> any,
    getconstant: (...any) -> any,
    setconstant: (...any) -> any,
    getconstants: (...any) -> any,
    getprotos: (...any) -> any,
    getproto: (...any) -> any,
    traceback: (...any) -> any,
    info: (...any) -> any,
    getinfo: (...any) -> any
}

declare LPH_NO_VIRTUALIZE: (...any) -> ...any
declare LRM_SEND_WEBHOOK: (...any) -> ...any
declare LRM_SANITIZE: (...any) -> ...any
declare LPH_OBFUSCATED: any
declare LRM_ScriptVersion: any

declare IY_LOADED: any
declare script_key: any

declare sethiddenproperty: any
declare checkclosure: (...any) -> ...any
declare identifyexecutor: (...any) -> ...any
declare restorefunction: (...any) -> ...any
declare isfunctionhooked: (...any) -> ...any
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
declare getscripts: (...any) -> ...any
declare getloadedmodules: (...any) -> ...any
declare getconnections: (...any) -> ...any
declare firesignal: (...any) -> ...any
declare fireclickdetector: (...any) -> ...any
declare fireproximityprompt: (...any) -> ...any
declare firetouchinterest: (...any) -> ...any
declare isnetworkowner: (...any) -> ...any
declare gethiddenproperty: (...any) -> ...any
declare setsimulationradius: (...any) -> ...any
declare getsenv: (...any) -> ...any
declare getcallingscript: (...any) -> ...any
declare getscriptclosure: (...any) -> ...any
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
declare hookfunction: (...any) -> ...any
declare hookmetamethod: (...any) -> ...any
declare newcclosure: (...any) -> ...any
declare loadstring: (...any) -> ...any
declare checkcaller: (...any) -> ...any
declare islclosure: (...any) -> ...any
declare dumpstring: (...any) -> ...any
declare decompile: (...any) -> ...any
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