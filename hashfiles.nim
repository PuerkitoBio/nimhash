import threadpool, md5, os, streams

proc processPath(path: string) {.thread.} =
    var md5ctx: MD5Context

    # Is the path a regular file?
    let fi = getFileInfo(path)
    if fi.kind != pcFile:
        return

    # Compute the md5 of its content
    let strm = newFileStream(path, fmRead)
    finally: close(strm)

    # write each line to the md5 hasher
    var hash: MD5Digest
    md5Init(md5ctx)

    while true:
        let line = readStr(strm, 1024)
        if line.len == 0: break
        md5Update(md5ctx, line, line.len)

    # get the final hash value
    md5Final(md5ctx, hash)

    # and print the results
    echo path, ": ", hash

proc walkDir*(startDir: string) =
    for path in walkDirRec(startDir):
        spawn processPath(path)
    sync()
