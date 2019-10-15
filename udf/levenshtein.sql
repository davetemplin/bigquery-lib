CREATE OR REPLACE FUNCTION udf.levenshtein(source STRING, target STRING)
RETURNS INT64
LANGUAGE js
AS
"""var rollup=function(){\"use strict\";return function(){function r(r,t,e,o,n){return r<t||e<t?r>e?e+1:r+1:o===n?t:t+1}return function(t,e){if(t===e)return 0;if(t.length>e.length){var o=t;t=e,e=o}for(var n=t.length,h=e.length;n>0&&t.charCodeAt(n-1)===e.charCodeAt(h-1);)n--,h--;for(var a=0;a<n&&t.charCodeAt(a)===e.charCodeAt(a);)a++;if(h-=a,0===(n-=a)||h<3)return h;var c,f,u,d,A,C,i,l,v,g,s,p,b=0,j=[];for(c=0;c<n;c++)j.push(c+1),j.push(t.charCodeAt(a+c));for(var k=j.length-1;b<h-3;)for(v=e.charCodeAt(a+(f=b)),g=e.charCodeAt(a+(u=b+1)),s=e.charCodeAt(a+(d=b+2)),p=e.charCodeAt(a+(A=b+3)),C=b+=4,c=0;c<k;c+=2)f=r(i=j[c],f,u,v,l=j[c+1]),u=r(f,u,d,g,l),d=r(u,d,A,s,l),C=r(d,A,C,p,l),j[c]=C,A=d,d=u,u=f,f=i;for(;b<h;)for(v=e.charCodeAt(a+(f=b)),C=++b,c=0;c<k;c+=2)i=j[c],j[c]=C=r(i,f,C,v,j[c+1]),f=i;return C}}()}();
return rollup(source||'', target||'');
""";
