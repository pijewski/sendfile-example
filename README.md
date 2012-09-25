# sendfile-example

A simple example of using the
[sendfile(3EXT)](http://illumos.org/man/3ext/sendfile) interface.  The sendfile
interface allows data to be streamed between two file descriptors without
copying it to and from userspace.

## Status

This has been tested on SmartOS, a distribution of the illumos platform.

## Examples

    # mkfile 10m 10m-file

    # ./sendfile 10m-file 10m-file.out $(( 10 * 1024 * 1024 ))
    Sent 10240 KiB over sendfile(3EXT) of 10240 KiB requested
    # ls -lh 10m-file.out
    -rwS---r-- 1 root root 10M Sep 25 11:40 10m-file.out

    # ./sendfile 10m-file 10m-file.out $(( 9 * 1024 * 1024 ))
    Sent 9216 KiB over sendfile(3EXT) of 9216 KiB requested
    # ls -lh 10m-file.out
    -rwS--x--- 1 root root 9.0M Sep 25 11:40 10m-file.out

    # ./sendfile 10m-file 10m-file.out $(( 11 * 1024 * 1024 ))
    Warning: sendfile(3EXT) returned -1 (errno 22)
    Sent 10240 KiB over sendfile(3EXT) of 11264 KiB requested
    # ls -lh 10m-file.out
    -rwS---r-- 1 root root 10M Sep 25 11:40 10m-file.out
