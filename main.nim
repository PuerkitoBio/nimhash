import parseopt2, hashfiles

proc main() =
    var p = initOptParser()
    next(p)
    if p.kind == cmdEnd:
        echo "a starting directory must be provided"
        quit 1

    walkDir(p.key)

when isMainModule:
    main()
