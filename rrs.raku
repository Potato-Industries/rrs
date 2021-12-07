await IO::Socket::Async.connect('localhost', 9090).then( -> $promise {
    while 1 {
        given $promise.result {
            react {
                whenever .Supply() -> $v {
                    my $p = shell $v, :out;
                    my $o = $p.out.slurp(:close);
                    .print($o);
                    done;
                 }
             }
        }
    }
    done;
});
