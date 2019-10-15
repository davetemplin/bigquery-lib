```
--https://mathiasbynens.be/demo/url-regex
--@mattfarina


^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?(?:/[^\s]*)?$
 [ scheme            ][ user           ]{  [ ip-address                                                                                                     ] [ subdomain                                                   ][ domain                                                         ][ top-level domain                 ]}[ port      ][ path     ]




^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9_]+-*)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9_]+-*)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9-]{2,})))(?::\d{2,5})?(?:/[^/?#]*)*(?:\?[^#]*)?(?:#.*)?$
 [ scheme            ][ user           ]{  [ ip-address                                                                                                     ] [ subdomain                                                    ][ domain                                                          ][ top-level domain                     ]}[ port      ][ path      ][ query    ][ hash ]

http://foo.com#bar
http://foo.com?bar
https://xn--b1afblufcdrdkmek.xn--p1ai/
http://xn----8sbb3akwgfdmdif5dxc.xn--p1ai/риджид-каталог-пилы-свёрла-для-сверления.htm
```
