(function(){var h=true,i=null,j=false,aa=(new Date).getTime(),ba=function(a){var b=(new Date).getTime()-aa;b="&dtd="+(b<1E3?b:"M");return a+b};var k=this,ca=function(a,b,c){a=a.split(".");c=c||k;!(a[0]in c)&&c.execScript&&c.execScript("var "+a[0]);for(var d;a.length&&(d=a.shift());)if(!a.length&&b!==undefined)c[d]=b;else c=c[d]?c[d]:(c[d]={})},l=function(a){var b=typeof a;if(b=="object")if(a){if(a instanceof Array||!(a instanceof Object)&&Object.prototype.toString.call(a)=="[object Array]"||typeof a.length=="number"&&typeof a.splice!="undefined"&&typeof a.propertyIsEnumerable!="undefined"&&!a.propertyIsEnumerable("splice"))return"array";
if(!(a instanceof Object)&&(Object.prototype.toString.call(a)=="[object Function]"||typeof a.call!="undefined"&&typeof a.propertyIsEnumerable!="undefined"&&!a.propertyIsEnumerable("call")))return"function"}else return"null";else if(b=="function"&&typeof a.call=="undefined")return"object";return b},m=function(a){return l(a)=="array"},da=function(a){var b=l(a);return b=="array"||b=="object"&&typeof a.length=="number"},n=function(a){return typeof a=="string"},ea=function(a){a=l(a);return a=="object"||
a=="array"||a=="function"},fa=function(a){var b=l(a);if(b=="object"||b=="array"){if(a.clone)return a.clone.call(a);b=b=="array"?[]:{};for(var c in a)b[c]=fa(a[c]);return b}return a},ga=function(a,b){var c=b||k;if(arguments.length>2){var d=Array.prototype.slice.call(arguments,2);return function(){var e=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(e,d);return a.apply(c,e)}}else return function(){return a.apply(c,arguments)}},p=function(a,b,c){ca(a,b,c)},ha=function(a,b){function c(){}
c.prototype=b.prototype;a.Y=b.prototype;a.prototype=new c;a.prototype.constructor=a};var q=function(a,b){a=parseFloat(a);return isNaN(a)||a>1||a<0?b:a},ia=function(a,b){if(a=="true")return h;if(a=="false")return j;return b},ja=/^([\w-]+\.)*([\w-]{2,})(\:[0-9]+)?$/,r=function(a,b){if(!a)return b;return(a=a.match(ja))?a[0]:b};var ka=function(){return r("","googleads.g.doubleclick.net")},la=function(){return r("","pagead2.googlesyndication.com")},s=function(){return r("","pagead2.googlesyndication.com")};var t=Array.prototype,ma=t.forEach?function(a,b,c){t.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=n(a)?a.split(""):a,f=0;f<d;f++)f in e&&b.call(c,e[f],f,a)},na=function(){return t.concat.apply(t,arguments)},oa=function(a){if(m(a))return na(a);else{for(var b=[],c=0,d=a.length;c<d;c++)b[c]=a[c];return b}};var u=function(a,b){this.width=a;this.height=b};u.prototype.clone=function(){return new u(this.width,this.height)};u.prototype.toString=function(){return"("+this.width+" x "+this.height+")"};u.prototype.ceil=function(){this.width=Math.ceil(this.width);this.height=Math.ceil(this.height);return this};u.prototype.floor=function(){this.width=Math.floor(this.width);this.height=Math.floor(this.height);return this};
u.prototype.round=function(){this.width=Math.round(this.width);this.height=Math.round(this.height);return this};u.prototype.scale=function(a){this.width*=a;this.height*=a;return this};var pa=function(a,b,c){for(var d in a)b.call(c,a[d],d,a)};var qa=function(a){for(var b=1;b<arguments.length;b++){var c=String(arguments[b]).replace(/\$/g,"$$$$");a=a.replace(/\%s/,c)}return a},wa=function(a,b){if(b)return a.replace(ra,"&amp;").replace(sa,"&lt;").replace(ta,"&gt;").replace(ua,"&quot;");else{if(!va.test(a))return a;if(a.indexOf("&")!=-1)a=a.replace(ra,"&amp;");if(a.indexOf("<")!=-1)a=a.replace(sa,"&lt;");if(a.indexOf(">")!=-1)a=a.replace(ta,"&gt;");if(a.indexOf('"')!=-1)a=a.replace(ua,"&quot;");return a}},ra=/&/g,sa=/</g,ta=/>/g,ua=/\"/g,
va=/[&<>\"]/,za=function(a){if(a.indexOf("&")!=-1)return"document"in k&&a.indexOf("<")==-1?xa(a):ya(a);return a},xa=function(a){var b=k.document.createElement("a");b.innerHTML=a;b.normalize&&b.normalize();a=b.firstChild.nodeValue;b.innerHTML="";return a},ya=function(a){return a.replace(/&([^;]+);/g,function(b,c){switch(c){case "amp":return"&";case "lt":return"<";case "gt":return">";case "quot":return'"';default:if(c.charAt(0)=="#"){c=Number("0"+c.substr(1));if(!isNaN(c))return String.fromCharCode(c)}return b}})},
Aa=function(a,b){for(var c=b.length,d=0;d<c;d++){var e=c==1?b:b.charAt(d);if(a.charAt(0)==e&&a.charAt(a.length-1)==e)return a.substring(1,a.length-1)}return a},Ca=function(a,b){var c=0;a=String(a).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split(".");b=String(b).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split(".");for(var d=Math.max(a.length,b.length),e=0;c==0&&e<d;e++){var f=a[e]||"",g=b[e]||"",o=new RegExp("(\\d*)(\\D*)","g"),A=new RegExp("(\\d*)(\\D*)","g");do{var H=o.exec(f)||["","",""],I=A.exec(g)||["",
"",""];if(H[0].length==0&&I[0].length==0)break;c=H[1].length==0?0:parseInt(H[1],10);var Db=I[1].length==0?0:parseInt(I[1],10);c=Ba(c,Db)||Ba(H[2].length==0,I[2].length==0)||Ba(H[2],I[2])}while(c==0)}return c},Ba=function(a,b){if(a<b)return-1;else if(a>b)return 1;return 0};var v,Da,w,Ea,Fa,Ga,Ha,Ia,Ja,Ka=function(){return k.navigator?k.navigator.userAgent:i},x=function(){return k.navigator},La=function(){Fa=Ea=w=Da=v=j;var a;if(a=Ka()){var b=x();v=a.indexOf("Opera")==0;Da=!v&&a.indexOf("MSIE")!=-1;Ea=(w=!v&&a.indexOf("WebKit")!=-1)&&a.indexOf("Mobile")!=-1;Fa=!v&&!w&&b.product=="Gecko"}};La();
var y=v,z=Da,Ma=Fa,Na=w,Oa=Ea,Pa=function(){var a=x();return a&&a.platform||""},Qa=Pa(),Ra=function(){Ga=Qa.indexOf("Mac")!=-1;Ha=Qa.indexOf("Win")!=-1;Ia=Qa.indexOf("Linux")!=-1;Ja=!!x()&&(x().appVersion||"").indexOf("X11")!=-1};Ra();
var Sa=Ga,Ta=Ha,Ua=Ia,Va=function(){var a="",b;if(y&&k.opera){a=k.opera.version;a=typeof a=="function"?a():a}else{if(Ma)b=/rv\:([^\);]+)(\)|;)/;else if(z)b=/MSIE\s+([^\);]+)(\)|;)/;else if(Na)b=/WebKit\/(\S+)/;if(b)a=(a=b.exec(Ka()))?a[1]:""}return a},Wa=Va(),Xa={},B=function(a){return Xa[a]||(Xa[a]=Ca(Wa,a)>=0)};var Ya=function(a){return n(a)?document.getElementById(a):a},Za=Ya,ab=function(a,b){pa(b,function(c,d){if(d=="style")a.style.cssText=c;else if(d=="class")a.className=c;else if(d=="for")a.htmlFor=c;else if(d in $a)a.setAttribute($a[d],c);else a[d]=c})},$a={cellpadding:"cellPadding",cellspacing:"cellSpacing",colspan:"colSpan",rowspan:"rowSpan",valign:"vAlign",height:"height",width:"width",usemap:"useMap",frameborder:"frameBorder",type:"type"},bb=function(a){var b=a.document;if(Na&&!B("500")&&!Oa){if(typeof a.innerHeight==
"undefined")a=window;b=a.innerHeight;var c=a.document.documentElement.scrollHeight;if(a==a.top)if(c<b)b-=15;return new u(a.innerWidth,b)}a=b.compatMode=="CSS1Compat"&&(!y||y&&B("9.50"))?b.documentElement:b.body;return new u(a.clientWidth,a.clientHeight)},db=function(){return cb(document,arguments)},cb=function(a,b){var c=b[0],d=b[1];if(z&&d&&(d.name||d.type)){c=["<",c];d.name&&c.push(' name="',wa(d.name),'"');if(d.type){c.push(' type="',wa(d.type),'"');d=fa(d);delete d.type}c.push(">");c=c.join("")}var e=
a.createElement(c);if(d)if(n(d))e.className=d;else ab(e,d);if(b.length>2){d=function(g){if(g)e.appendChild(n(g)?a.createTextNode(g):g)};for(c=2;c<b.length;c++){var f=b[c];da(f)&&!(ea(f)&&f.nodeType>0)?ma(eb(f)?oa(f):f,d):d(f)}}return e},fb=function(a,b){a.appendChild(b)},eb=function(a){if(a&&typeof a.length=="number")if(ea(a))return typeof a.item=="function"||typeof a.item=="string";else if(l(a)=="function")return typeof a.item=="function";return j};var gb=document,C=window;s();var D=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b.call(i,a[c],c,a)},ib=function(a,b){if(!a||!ea(a))return h;return!hb(a,b.prototype)},hb=function(a,b){if(!a)return j;var c=h;D(b,function(d,e){if(!c||!(e in a)||typeof d!=typeof a[e])c=j});return c},jb=function(a){if(arguments.length<2)return a.length;for(var b=1,c=arguments.length;b<c;++b)a.push(arguments[b]);return a.length};
function E(a){return typeof encodeURIComponent=="function"?encodeURIComponent(a):escape(a)}function kb(a,b,c){var d=document.createElement("script");d.type="text/javascript";if(b)d.onload=b;if(c)d.id=c;d.src=a;var e=document.getElementsByTagName("head")[0];if(!e)return j;window.setTimeout(function(){e.appendChild(d)},0);return h}function lb(a,b){if(a.attachEvent){a.attachEvent("onload",b);return h}if(a.addEventListener){a.addEventListener("load",b,j);return h}return j}
function mb(a,b){a.google_image_requests||(a.google_image_requests=[]);var c=new Image;c.src=b;a.google_image_requests.push(c)}function nb(a){if(a in ob)return ob[a];return ob[a]=navigator.userAgent.toLowerCase().indexOf(a)!=-1}var ob={};
function pb(){if(navigator.plugins&&navigator.mimeTypes.length){var a=navigator.plugins["Shockwave Flash"];if(a&&a.description)return a.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s)+r/,".")}else if(navigator.userAgent&&navigator.userAgent.indexOf("Windows CE")>=0){a=3;for(var b=1;b;)try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+(a+1));a++}catch(c){b=i}return a.toString()}else if(nb("msie")&&!window.opera){b=i;try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(d){a=
0;try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");a=6;b.AllowScriptAccess="always"}catch(e){if(a==6)return a.toString()}try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(f){}}if(b){a=b.GetVariable("$version").split(" ")[1];return a.replace(/,/g,".")}}return"0"}function F(a){var b=a.google_ad_format;if(b)return b.indexOf("_0ads")>0;return a.google_ad_output!="html"&&a.google_num_radlinks>0}function G(a){return!!a&&a.indexOf("_sdo")!=-1}
function J(a,b){if(!(Math.random()<1.0E-4)){var c=Math.random();if(c<b){b=Math.floor(c/b*a.length);return a[b]}}return""}
var qb=function(a){a.u_tz=-(new Date).getTimezoneOffset();a.u_his=window.history.length;a.u_java=navigator.javaEnabled();if(window.screen){a.u_h=window.screen.height;a.u_w=window.screen.width;a.u_ah=window.screen.availHeight;a.u_aw=window.screen.availWidth;a.u_cd=window.screen.colorDepth}if(navigator.plugins)a.u_nplug=navigator.plugins.length;if(navigator.mimeTypes)a.u_nmime=navigator.mimeTypes.length},rb=function(a){var b=C;if(a&&b.top!=b)b=b.top;try{return b.document&&!b.document.body?new u(-1,
-1):bb(b||window)}catch(c){return new u(-12245933,-12245933)}},sb=function(a,b){var c=a.length;if(c==0)return 0;b=b||305419896;for(var d=0;d<c;d++){var e=a.charCodeAt(d);b^=(b<<5)+(b>>2)+e&4294967295}return b},tb=function(a){if(a==a.top)return 0;var b=[];b.push(document.URL);a.name&&b.push(a.name);a=h;a=rb(!a);b.push(a.width.toString());b.push(a.height.toString());b=sb(b.join(""));return b>0?b:4294967296+b};var ub={google_ad_channel:"channel",google_ad_host:"host",google_ad_host_channel:"h_ch",google_ad_host_tier_id:"ht_id",google_ad_section:"region",google_ad_type:"ad_type",google_adtest:"adtest",google_allow_expandable_ads:"ea",google_alternate_ad_url:"alternate_ad_url",google_alternate_color:"alt_color",google_bid:"bid",google_city:"gcs",google_color_bg:"color_bg",google_color_border:"color_border",google_color_line:"color_line",google_color_link:"color_link",google_color_text:"color_text",google_color_url:"color_url",
google_contents:"contents",google_country:"gl",google_cpm:"cpm",google_cust_age:"cust_age",google_cust_ch:"cust_ch",google_cust_gender:"cust_gender",google_cust_id:"cust_id",google_cust_interests:"cust_interests",google_cust_job:"cust_job",google_cust_l:"cust_l",google_cust_lh:"cust_lh",google_cust_u_url:"cust_u_url",google_disable_video_autoplay:"disable_video_autoplay",google_ed:"ed",google_encoding:"oe",google_feedback:"feedback_link",google_flash_version:"flash",google_font_face:"f",google_font_size:"fs",
google_hints:"hints",google_kw:"kw",google_kw_type:"kw_type",google_language:"hl",google_page_url:"url",google_region:"gr",google_reuse_colors:"reuse_colors",google_safe:"adsafe",google_tag_info:"gut",google_targeting:"targeting",google_ui_features:"ui",google_ui_version:"uiv",google_video_doc_id:"video_doc_id",google_video_product_type:"video_product_type"},vb={google_ad_client:"client",google_ad_format:"format",google_ad_output:"output",google_ad_callback:"callback",google_ad_height:"h",google_ad_override:"google_ad_override",
google_ad_slot:"slotname",google_ad_width:"w",google_ctr_threshold:"ctr_t",google_image_size:"image_size",google_last_modified_time:"lmt",google_max_num_ads:"num_ads",google_max_radlink_len:"max_radlink_len",google_num_radlinks:"num_radlinks",google_num_radlinks_per_unit:"num_radlinks_per_unit",google_only_ads_with_video:"only_ads_with_video",google_rl_dest_url:"rl_dest_url",google_rl_filtering:"rl_filtering",google_rl_mode:"rl_mode",google_rt:"rt",google_skip:"skip"},wb={google_only_pyv_ads:"pyv",
google_with_pyv_ads:"withpyv"};function xb(a,b){try{return a.top.document.URL==b.URL}catch(c){}return j}function yb(a,b,c,d){c=c||a.google_ad_width;d=d||a.google_ad_height;if(xb(a,b))return j;var e=b.documentElement;if(c&&d){var f=1,g=1;if(a.innerHeight){f=a.innerWidth;g=a.innerHeight}else if(e&&e.clientHeight){f=e.clientWidth;g=e.clientHeight}else if(b.body){f=b.body.clientWidth;g=b.body.clientHeight}if(g>2*d||f>2*c)return j}return h}function zb(a,b){D(b,function(c,d){a["google_"+d]=c})}
function Ab(a,b){if(!b)return a.URL;return a.referrer}function Bb(a,b){if(!b&&a.google_referrer_url==i)return"0";else if(b&&a.google_referrer_url==i)return"1";else if(!b&&a.google_referrer_url!=i)return"2";else if(b&&a.google_referrer_url!=i)return"3";return"4"}function Cb(a,b,c,d){a.page_url=Ab(c,d);a.page_location=i}function Eb(a,b,c,d){a.page_url=b.google_page_url;a.page_location=Ab(c,d)||"EMPTY"}
function Fb(a,b){var c={},d=yb(a,b,a.google_ad_width,a.google_ad_height);c.iframing=Bb(a,d);a.google_page_url?Eb(c,a,b,d):Cb(c,a,b,d);c.last_modified_time=b.URL==c.page_url?Date.parse(b.lastModified)/1E3:i;c.referrer_url=d?a.google_referrer_url:a.google_page_url&&a.google_referrer_url?a.google_referrer_url:b.referrer;return c}function Gb(a){var b={},c=a.URL.substring(a.URL.lastIndexOf("http"));b.iframing=i;b.page_url=c;b.page_location=a.URL;b.last_modified_time=i;b.referrer_url=c;return b}
function Hb(a,b){b=Ib(a,b);zb(a,b)}function Ib(a,b){return a=a.google_page_url==i&&Jb[b.domain]?Gb(b):Fb(a,b)}var Jb={};Jb["ad.yieldmanager.com"]=h;var Kb=q("0.0001",0),Lb=q("1",0),Mb=q("0.01",0),Nb=q("0.01",0),Ob=q("0.008",0),Pb=q("0.01",0),Qb=q("0",0);var Rb=ia("false",j),Sb=ia("false",j),Tb=ia("false",j);var Ub=function(a,b,c){b=ga(b,k,a);a=window.onerror;window.onerror=b;try{c()}catch(d){c=d.toString();var e="";if(d.fileName)e=d.fileName;var f=-1;if(d.lineNumber)f=d.lineNumber;b=b(c,e,f);if(!b)throw d;}window.onerror=a};p("google_protectAndRun",Ub);
var Wb=function(a,b,c,d){if(Math.random()<0.01){var e=gb;a=["http://",la(),"/pagead/gen_204","?id=jserror","&jscb=",Rb?1:0,"&jscd=",Sb?1:0,"&context=",E(a),"&msg=",E(b),"&file=",E(c),"&line=",E(d.toString()),"&url=",E(e.URL.substring(0,512)),"&ref=",E(e.referrer.substring(0,512))];a.push(Vb());mb(C,a.join(""))}return!Tb};p("google_handleError",Wb);
var Yb=function(a){Xb|=a},Xb=0,Vb=function(){var a=["&client=",E(C.google_ad_client),"&format=",E(C.google_ad_format),"&slotname=",E(C.google_ad_slot),"&output=",E(C.google_ad_output),"&ad_type=",E(C.google_ad_type)];return a.join("")};var Zb="",bc=function(){if(window.google_ad_frameborder==i)window.google_ad_frameborder=0;if(window.google_ad_output==i)window.google_ad_output="html";if(G(window.google_ad_format)){var a=window.google_ad_format.match(/^(\d+)x(\d+)_.*/);if(a){window.google_ad_width=parseInt(a[1],10);window.google_ad_height=parseInt(a[2],10);window.google_ad_output="html"}}window.google_ad_format=$b(window.google_ad_format,window.google_ad_output,window.google_ad_width,window.google_ad_height,window.google_ad_slot,
!!window.google_override_format);Zb=window.google_ad_client||"";window.google_ad_client=ac(window.google_ad_format,window.google_ad_client);Hb(window,document);if(window.google_flash_version==i)window.google_flash_version=pb();window.google_ad_section=window.google_ad_section||window.google_ad_region||"";window.google_country=window.google_country||window.google_gl||"";a=(new Date).getTime();if(m(window.google_color_bg))window.google_color_bg=K(window.google_color_bg,a);if(m(window.google_color_text))window.google_color_text=
K(window.google_color_text,a);if(m(window.google_color_link))window.google_color_link=K(window.google_color_link,a);if(m(window.google_color_url))window.google_color_url=K(window.google_color_url,a);if(m(window.google_color_border))window.google_color_border=K(window.google_color_border,a);if(m(window.google_color_line))window.google_color_line=K(window.google_color_line,a)},cc=function(a){D(ub,function(b,c){a[c]=i});D(vb,function(b,c){a[c]=i});D(wb,function(b,c){a[c]=i});a.google_container_id=i;
a.google_eids=i;a.google_page_location=i;a.google_referrer_url=i;a.google_ad_region=i;a.google_gl=i},K=function(a,b){Yb(2);return a[b%a.length]},ac=function(a,b){if(!b)return"";b=b.toLowerCase();return b=G(a)?dc(b):ec(b)},ec=function(a){if(a&&a.substring(0,3)!="ca-")a="ca-"+a;return a},dc=function(a){if(a&&a.substring(0,7)!="ca-aff-")a="ca-aff-"+a;return a},$b=function(a,b,c,d,e,f){if(!a&&b=="html")a=c+"x"+d;return a=fc(a,e,f)?a.toLowerCase():""},fc=function(a,b,c){if(!a)return j;if(!b)return h;return c};var L=document,M=navigator,N=window;
function gc(){var a=L.cookie,b=Math.round((new Date).getTime()/1E3),c=N.google_analytics_domain_name;c=typeof c=="undefined"?hc("auto"):hc(c);var d=a.indexOf("__utma="+c+".")>-1,e=a.indexOf("__utmb="+c)>-1,f=a.indexOf("__utmc="+c)>-1,g={},o=!!N&&!!N.gaGlobal;if(d){a=a.split("__utma="+c+".")[1].split(";")[0].split(".");g.sid=e&&f?a[3]+"":o&&N.gaGlobal.sid?N.gaGlobal.sid:b+"";g.vid=a[0]+"."+a[1];g.from_cookie=h}else{g.sid=o&&N.gaGlobal.sid?N.gaGlobal.sid:b+"";g.vid=o&&N.gaGlobal.vid?N.gaGlobal.vid:
(Math.round(Math.random()*2147483647)^ic()&2147483647)+"."+b;g.from_cookie=j}g.dh=c;g.hid=o&&N.gaGlobal.hid?N.gaGlobal.hid:Math.round(Math.random()*2147483647);return N.gaGlobal=g}
function ic(){var a=L.cookie?L.cookie:"",b=N.history.length,c,d=[M.appName,M.version,M.language?M.language:M.browserLanguage,M.platform,M.userAgent,M.javaEnabled()?1:0].join("");if(N.screen)d+=N.screen.width+"x"+N.screen.height+N.screen.colorDepth;else if(N.java){c=java.awt.Toolkit.getDefaultToolkit().getScreenSize();d+=c.screen.width+"x"+c.screen.height}d+=a;d+=L.referrer?L.referrer:"";for(a=d.length;b>0;)d+=b--^a++;return jc(d)}
function jc(a){var b=1,c=0,d;if(!(a==undefined||a=="")){b=0;for(d=a.length-1;d>=0;d--){c=a.charCodeAt(d);b=(b<<6&268435455)+c+(c<<14);c=b&266338304;b=c!=0?b^c>>21:b}}return b}function hc(a){if(!a||a==""||a=="none")return 1;if("auto"==a){a=L.domain;if("www."==a.substring(0,4))a=a.substring(4,a.length)}return jc(a.toLowerCase())};var kc,lc,mc,nc,oc,pc,qc=function(){pc=oc=nc=mc=lc=kc=j;var a=Ka();if(a)if(a.indexOf("Firefox")!=-1)kc=h;else if(a.indexOf("Camino")!=-1)lc=h;else if(a.indexOf("iPhone")!=-1||a.indexOf("iPod")!=-1)mc=h;else if(a.indexOf("Android")!=-1)nc=h;else if(a.indexOf("Chrome")!=-1)oc=h;else if(a.indexOf("Safari")!=-1)pc=h};qc();var rc=function(a){var b="google_test";try{var c=a[b];a[b]=!c;if(a[b]===!c){a[b]=c;return h}}catch(d){}return j},sc=function(a){for(;a!=a.parent&&rc(a.parent);)a=a.parent;return a},O=i,tc=function(){if(!O){O=sc(window);O!=window&&Yb(4)}return O};var P=function(a){this.stack=(new Error).stack||"";if(a)this.message=String(a)};ha(P,Error);P.prototype.name="CustomError";var Q=function(a,b){b.unshift(a);P.call(this,qa.apply(i,b));b.shift();this.messagePattern=a};ha(Q,P);Q.prototype.name="AssertionError";var uc=function(a,b,c,d){var e="Assertion failed";if(c){e+=": "+c;var f=d}else if(a){e+=": "+a;f=b}throw new Q(""+e,f||[]);},vc=function(a,b){a||uc("",i,b,Array.prototype.slice.call(arguments,2))},wc=function(a){throw new Q("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));};var R=function(){this.defaultBucket=[];this.layers={};for(var a=0,b=arguments.length;a<b;++a)this.layers[arguments[a]]=""},xc=function(a){for(var b=new R,c=0,d=a.defaultBucket.length;c<d;++c)b.defaultBucket.push(a.defaultBucket[c]);D(a.layers,ga(R.prototype.i,b));return b};R.prototype.i=function(a,b){this.layers[b]=a};R.prototype.U=function(a,b){if(a=="")return"";if(!b){this.defaultBucket.push(a);return a}if(this.layers.hasOwnProperty(b))return this.layers[b]=a;return""};
R.prototype.g=function(a,b,c){if(!(Math.random()<1.0E-4)&&this.K(c)){var d=Math.random();if(d<b){b=Math.floor(a.length*d/b);if(a=a[b])return this.U(a,c)}}return""};R.prototype.K=function(a){if(!a)return h;return this.layers.hasOwnProperty(a)&&this.layers[a]==""};R.prototype.l=function(a){if(this.layers.hasOwnProperty(a))return this.layers[a];return""};
R.prototype.B=function(){var a=[],b=function(c){c!=""&&a.push(c)};D(this.layers,b);if(this.defaultBucket.length>0&&a.length>0)return this.defaultBucket.join(",")+","+a.join(",");return this.defaultBucket.join(",")+a.join(",")};var S=function(a){this.W=a;this.S()},T,U=function(){if(T)return T;if(ib(window.google_persistent_state,S)){var a=window;return window.google_persistent_state=T=new S(a)}return T=window.google_persistent_state};S.prototype.S=function(){this.a(1,j);this.a(2,j);this.a(3,i);this.a(4,0);this.a(5,0);this.a(6,0);this.a(8,{});this.a(9,{});this.a(10,{});this.a(11,[]);this.a(13,0);this.T((new Date).getTime());this.t(0)};
var yc=function(a){switch(a){case 1:return"google_new_domain_enabled";case 2:return"google_new_domain_checked";case 3:return"google_exp_persistent";case 4:return"google_num_sdo_slots";case 5:return"google_num_0ad_slots";case 6:return"google_num_ad_slots";case 7:return"google_correlator";case 8:return"google_prev_ad_formats_by_region";case 9:return"google_prev_ad_slotnames_by_region";case 10:return"google_num_slots_by_channel";case 11:return"google_viewed_host_channels";case 12:return"google_num_slot_to_show";
case 13:return"google_unique_id"}wc("Unrecognized public key: "+a)};S.prototype.b=function(a){a=yc(a);a=this.W[a];vc(a!==undefined,"Values must be set before they are accessed or we might violate @type.");return a};S.prototype.a=function(a,b){return this.W[yc(a)]=b};S.prototype.c=function(a){return this.a(a,this.b(a)+1)};S.prototype.j=function(){if(this.b(1))return h;return this.a(1,!!window.google_new_domain_enabled)};S.prototype.k=function(){return this.b(2)};
S.prototype.s=function(){return this.a(2,h)};S.prototype.C=function(){return this.b(3)};S.prototype.V=function(a){return this.a(3,a)};S.prototype.J=function(){return this.c(4)};S.prototype.I=function(){return this.c(5)};S.prototype.G=function(){return this.c(6)};S.prototype.getCorrelator=function(){return this.b(7)};S.prototype.T=function(a){return this.a(7,a)};S.prototype.n=function(){return this.b(8)};S.prototype.o=function(){return this.b(9)};S.prototype.D=function(){return this.b(10)};
S.prototype.F=function(){return this.b(11)};S.prototype.p=function(){return this.b(12)};S.prototype.t=function(a){return this.a(12,a)};S.prototype.d=function(){return this.b(13)};S.prototype.H=function(){return this.c(13)};var V,zc,W=function(){if(V)return V;var a=U(),b=a.C();if(ib(b,R))return V=a.V(new R(1,2));return V=b},Ac=function(){zc||(zc=xc(W()));return zc};var Bc={google:1,googlegroups:1,gmail:1,googlemail:1,googleimages:1,googleprint:1};function Cc(a){a=a.google_page_location||a.google_page_url;if(!a)return j;a=a.toString();if(a.indexOf("http://")==0)a=a.substring(7,a.length);else if(a.indexOf("https://")==0)a=a.substring(8,a.length);var b=a.indexOf("/");if(b==-1)b=a.length;a=a.substring(0,b);a=a.split(".");b=j;if(a.length>=3)b=a[a.length-3]in Bc;if(a.length>=2)b=b||a[a.length-2]in Bc;return b}
function Dc(a,b,c){var d=U();if(Cc(a))return!d.s();if(!d.k()){a=Math.random();if(a<=c){c="http://"+ka()+"/pagead/test_domain.js";a="script";b.write("<"+a+' src="'+c+'"></'+a+">");return d.s()}}return j}var Ec=function(a){var b=W();if(b.l(1)=="44901216")return 1==Math.floor(a/2)%2;return j};function Fc(a){var b=U();if(!Cc(a)&&b.j())return Ec(b.d())?"http://"+r("","googleads2.g.doubleclick.net"):"http://"+ka();return"http://"+la()};var X=function(a){this.X=a;this.r=[];this.q=0;this.e=[];this.O=0;this.f=[];this.M=j;this.u=this.v="";this.L=j};X.prototype.Q=function(a,b){var c=this.X[b],d=this.r;this.X[b]=function(e){if(e&&e.length>0){var f=e.length>1?e[1].url:i;d.push([a,za(e[0].url),f])}c(e)}};X.prototype.P=function(){this.q++};X.prototype.R=function(a){this.e.push(a)};var Gc="http://"+s()+"/pagead/osd.js";X.prototype.N=function(){if(!this.M){lb(C,Hc);kb(Gc);this.M=h}};
X.prototype.w=function(a){if(this.q>0)for(var b=document.getElementsByTagName("iframe"),c=this.L?"google_ads_iframe_":"google_ads_frame",d=0;d<b.length;d++){var e=b.item(d);e.src&&e.name&&e.name.indexOf(c)==0&&a(e,e.src)}};
X.prototype.z=function(a){var b=this.r;if(b.length>0)for(var c=document.getElementsByTagName("a"),d=0;d<c.length;d++)for(var e=0;e<b.length;e++)if(c.item(d).href==b[e][1]){var f=c.item(d).parentNode;if(b[e][2])for(var g=f,o=0;o<4;o++){if(g.innerHTML.indexOf(b[e][2])>0){f=g;break}g=g.parentNode}a(f,b[e][0]);b.splice(e,1);break}};X.prototype.A=function(a){for(var b=0;b<this.e.length;b++){var c=this.e[b],d=Ic(c);if(d)(d=document.getElementById("google_ads_div_"+d))&&a(d,c)}};
X.prototype.h=function(a){this.z(a);this.A(a);this.w(a)};X.prototype.setupOsd=function(a,b,c){this.O=a;this.v=b;this.u=c};X.prototype.getOsdMode=function(){return this.O};X.prototype.getEid=function(){return this.v};X.prototype.getCorrelator=function(){return this.u};X.prototype.m=function(){return this.r.length+this.q+this.e.length};X.prototype.setValidOutputTypes=function(a){this.f=a};
X.prototype.registerAdBlockByType=function(a,b,c){if(this.f.length>0){for(var d=0;d<this.f.length;d++)if(this.f[d]==a){this.L=c;if(a=="js")this.Q(b,"google_ad_request_done");else if(a=="html")this.P();else a=="json_html"&&this.R(b)}this.N()}};var Ic=function(a){if((a=a.match(/[&\?](?:slotname)=([^&]+)/))&&a.length==2)return a[1];return""},Hc=function(){C.google_osd_page_loaded=h},Jc=function(){window.__google_ad_urls||(window.__google_ad_urls=new X(window));return window.__google_ad_urls};
p("Goog_AdSense_getAdAdapterInstance",Jc);p("Goog_AdSense_OsdAdapter",X);p("Goog_AdSense_OsdAdapter.prototype.numBlocks",X.prototype.m);p("Goog_AdSense_OsdAdapter.prototype.findBlocks",X.prototype.h);p("Goog_AdSense_OsdAdapter.prototype.getOsdMode",X.prototype.getOsdMode);p("Goog_AdSense_OsdAdapter.prototype.getEid",X.prototype.getEid);p("Goog_AdSense_OsdAdapter.prototype.getCorrelator",X.prototype.getCorrelator);p("Goog_AdSense_OsdAdapter.prototype.setValidOutputTypes",X.prototype.setValidOutputTypes);
p("Goog_AdSense_OsdAdapter.prototype.setupOsd",X.prototype.setupOsd);p("Goog_AdSense_OsdAdapter.prototype.registerAdBlockByType",X.prototype.registerAdBlockByType);var Kc=function(a,b){var c=a.nodeType==9?a:a.ownerDocument||a.document;if(c.defaultView&&c.defaultView.getComputedStyle)if(a=c.defaultView.getComputedStyle(a,""))return a[b];return i},Lc=function(a,b){return Kc(a,b)||(a.currentStyle?a.currentStyle[b]:i)||a.style[b]},Mc=function(a,b,c,d){if(/^\d+px?$/.test(b))return parseInt(b,10);else{var e=a.style[c],f=a.runtimeStyle[c];a.runtimeStyle[c]=a.currentStyle[c];a.style[c]=b;b=a.style[d];a.style[c]=e;a.runtimeStyle[c]=f;return b}},Nc=function(a){var b=
a.nodeType==9?a:a.ownerDocument||a.document,c="";if(b.createTextRange){c=b.body.createTextRange();c.moveToElementText(a);c=c.queryCommandValue("FontName")}if(!c){c=Lc(a,"fontFamily");if(y&&Ua)c=c.replace(/ \[[^\]]*\]/,"")}a=c.split(",");if(a.length>1)c=a[0];return Aa(c,"\"'")},Oc=/[^\d]+$/,Pc=function(a){return(a=a.match(Oc))&&a[0]||i},Qc={cm:1,"in":1,mm:1,pc:1,pt:1},Rc={em:1,ex:1},Sc=function(a){var b=Lc(a,"fontSize"),c=Pc(b);if(b&&"px"==c)return parseInt(b,10);if(z)if(c in Qc)return Mc(a,b,"left",
"pixelLeft");else if(a.parentNode&&a.parentNode.nodeType==1&&c in Rc){a=a.parentNode;c=Lc(a,"fontSize");return Mc(a,b==c?"1em":b,"left","pixelLeft")}c=db("span",{style:"visibility:hidden;position:absolute;line-height:0;padding:0;margin:0;border:0;height:1em;"});fb(a,c);b=c.offsetHeight;c&&c.parentNode&&c.parentNode.removeChild(c);return b};var Y={};function Tc(a){if(a==1)return h;return!Y[a]}function Uc(a,b){if(!(!a||a==""))if(b==1)if(Y[b])Y[b]+=","+a;else Y[b]=a;else Y[b]=a}function Vc(){var a=[];D(Y,function(b){a.push(b)});return a.join(",")}function Wc(a,b){if(m(a))for(var c=0;c<a.length;c++)n(a[c])&&Uc(a[c],b)}var Z=j;
function Xc(a,b){var c="script";Z=Yc(a,b);if(!Z)a.google_allow_expandable_ads=j;var d=!Zc();Z&&d&&b.write("<"+c+' src="http://'+s()+'/pagead/expansion_embed.js"></'+c+">");a=Dc(a,b,Lb);(d=d||a)&&nb("msie")&&!window.opera?b.write("<"+c+' src="http://'+s()+'/pagead/render_ads.js"></'+c+">"):b.write("<"+c+'>google_protectAndRun("ads_core.google_render_ad", google_handleError, google_render_ad);</'+c+">")}function $(a){return a!=i?'"'+a+'"':'""'}
var $c=function(a,b){var c=b.slice(-1),d=c=="?"||c=="#"?"":"&",e=[b];b=function(f,g){if(f||f===0||f===j){if(typeof f=="boolean")f=f?1:0;jb(e,d,g,"=",E(f));d="&"}};D(a,b);return e.join("")};function ad(){var a=z&&B("6"),b=Ma&&B("1.8.1"),c=Na&&B("525");if(Ta&&(a||b||c))return h;else if(Sa&&(c||b))return h;else if(Ua&&b)return h;return j}
function Zc(){return(typeof ExpandableAdSlotFactory=="function"||typeof ExpandableAdSlotFactory=="object")&&typeof ExpandableAdSlotFactory.createIframe=="function"}function Yc(a,b){if(a.google_allow_expandable_ads===j||!b.body||a.google_ad_output!="html"||yb(a,b)||!bd(a)||isNaN(a.google_ad_height)||isNaN(a.google_ad_width)||!ad())return j;return h}function bd(a){var b=a.google_ad_format;if(G(b))return j;if(F(a)&&b!="468x15_0ads_al")return j;return h}
function cd(){var a;if(C.google_ad_output=="html"&&!(F(C)||G(C.google_ad_format))&&Tc(0)){a=["6083035","6083034"];a=J(a,Qb);Uc(a,0)}return a=="6083035"}function dd(a,b){var c=U();if(c.d()>0||G(a.google_ad_format))return"";c="";a=F(a);if(b=="html"||a)c=J(["36815001","36815002"],Mb);if(c==""&&(b=="js"||a))c=J(["36815003","36815004"],Nb);if(c==""&&(b=="html"||b=="js"))c=J(["36813005","36813006"],Ob);return c}
function ed(){var a=Jc(),b=window.google_enable_osd,c;if(b===h){c="36813006";fd(c,a)}else if(b!==j&&Tc(0)){c=a.getEid();if(c=="")(c=dd(window,window.google_ad_output))&&fd(c,a);else if(c!="36815001"&&c!="36815002"&&c!="36815003"&&c!="36815004"&&c!="36813005"&&c!="36813006")c=""}if(c){Uc(c,0);return c}return""}
function fd(a,b){var c=b.getOsdMode(),d=[];switch(a){case "36815004":c=1;d=["js"];break;case "36815002":c=1;d=["html"];break;case "36813006":c=0;d=["html","js"];break}d.length>0&&b.setValidOutputTypes(d);d=U();b.setupOsd(c,a,d.getCorrelator().toString())}
function gd(a,b,c,d){var e=U();e=e.H();c=$c({ifi:e},c);c=c.substring(0,1992);c=c.replace(/%\w?$/,"");var f="script";if((a.google_ad_output=="js"||a.google_ad_output=="json_html")&&(a.google_ad_request_done||a.google_radlink_request_done))b.write("<"+f+' language="JavaScript1.1" src='+$(ba(c))+"></"+f+">");else if(a.google_ad_output=="html")if(Z&&Zc()){b=a.google_container_id||d||i;a["google_expandable_ad_slot"+e]=ExpandableAdSlotFactory.createIframe("google_ads_frame"+e,ba(c),a.google_ad_width,a.google_ad_height,
b)}else{d='<iframe name="google_ads_frame" width='+$(a.google_ad_width)+" height="+$(a.google_ad_height)+" frameborder="+$(a.google_ad_frameborder)+" src="+$(ba(c))+' marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no"></iframe>';a.google_container_id?hd(a.google_container_id,b,d):b.write(d)}return c}function id(a){cc(a)}
function jd(a){var b=Ac().l(2)=="44901217";if(!kd(b))return j;b=cd();var c=Fc(window);a=ld(a);b=c+md(a.google_ad_format,b);window.google_ad_url=$c(a,b);return h}
var pd=function(a){a.dt=aa;var b=U(),c=b.n(),d=window.google_ad_section,e=window.google_ad_format,f=window.google_ad_slot;if(c[d])G(e)||(a.prev_fmts=c[d]);var g=b.o();if(g[d])a.prev_slotnames=g[d].toLowerCase();if(e){if(!G(e))if(c[d])c[d]+=","+e;else c[d]=e}else if(f)if(g[d])g[d]+=","+f;else g[d]=f;a.correlator=b.getCorrelator();if(b.k()&&!b.j())a.dblk=1;if(window.google_ad_channel){c=b.D();d="";e=window.google_ad_channel.split(nd);for(f=0;f<e.length;f++){g=e[f];if(c[g])d+=g+"+";else c[g]=h}a.pv_ch=
d}if(window.google_ad_host_channel){b=od(window.google_ad_host_channel,b.F());a.pv_h_ch=b}if(Rb)a.jscb=1;if(Sb)a.jscd=1;a.frm=window.google_iframing;b=gc();a.ga_vid=b.vid;a.ga_sid=b.sid;a.ga_hid=b.hid;a.ga_fc=b.from_cookie;a.ga_wpids=window.google_analytics_uacct},qd=function(a){var b=h;if(b=rb(b)){a.biw=b.width;a.bih=b.height}},rd=function(a){var b=tb(window);if(b!=0)a.ifk=b.toString()};
function od(a,b){var c=a.split("|");a=-1;for(var d=[],e=0;e<c.length;e++){var f=c[e].split(nd);b[e]||(b[e]={});for(var g="",o=0;o<f.length;o++){var A=f[o];if(A!="")if(b[e][A])g+="+"+A;else b[e][A]=h}g=g.slice(1);d[e]=g;if(g!="")a=e}b="";if(a>-1){for(e=0;e<a;e++)b+=d[e]+"|";b+=d[a]}return b}function sd(){var a=["44901212","44901216"];W().g(a,Kb,1);a=["44901218","44901217"];W().g(a,Pb,2)}
function td(){tc();var a=U();0==a.d()&&sd();a=ed();var b=Math.random()<0.01,c=i,d="";if(b){d="google_temp_span";c=ud(d)}b=jd(c);c&&c.id==d&&(c&&c.parentNode?c.parentNode.removeChild(c):i);if(b){c=gd(window,document,window.google_ad_url);a&&Jc().registerAdBlockByType(window.google_ad_output,c,j);id(window)}}
var vd=function(a){D(vb,function(b,c){a[b]=window[c]});D(ub,function(b,c){a[b]=window[c]});D(wb,function(b,c){a[b]=window[c]})},wd=function(a){Wc(window.google_eids,1);a.eid=Vc();var b=Ac().B();if(a.eid.length>0&&b.length>0)a.eid+=",";a.eid+=b};function xd(a,b,c,d){a=Wb(a,b,c,d);Xc(window,document);return a}function yd(){bc()}
function zd(a){var b={};a=a.split("?");a=a[a.length-1].split("&");for(var c=0;c<a.length;c++){var d=a[c].split("=");if(d[0])try{b[d[0].toLowerCase()]=d.length>1?window.decodeURIComponent?decodeURIComponent(d[1].replace(/\+/g," ")):unescape(d[1]):""}catch(e){}}return b}function Ad(){var a=window,b=zd(document.URL);if(b.google_ad_override){a.google_ad_override=b.google_ad_override;a.google_adtest="on"}}
function hd(a,b,c){if(a)if((a=b.getElementById(a))&&c&&c.length!=""){a.style.visibility="visible";a.innerHTML=c}}
var md=function(a,b){return a=G(a)?"/pagead/sdo?":b?"/pagead/render_iframe_ads.html#":"/pagead/ads?"},Bd=function(a,b){b.dff=Nc(a);b.dfs=Sc(a)},Cd=function(a){a.ref=window.google_referrer_url;a.loc=window.google_page_location},kd=function(a){var b=U(),c=b.n(),d=b.o(),e=window.google_ad_section;if(G(window.google_ad_format)){if(b.J()>4&&!a)return j}else if(F(window)){if(b.I()>3&&!a)return j}else{var f=b.G();if(window.google_num_slots_to_rotate){Yb(1);c[e]="";d[e]="";b.p()||b.t((new Date).getTime()%
window.google_num_slots_to_rotate+1);if(b.p()!=f)return j}else if(!a&&f>6&&e=="")return j}return h},ld=function(a){var b={};vd(b);pd(b);qb(b);a&&Bd(a,b);qd(b);rd(b);wd(b);Cd(b);b.fu=Xb;return b},ud=function(a){var b=window.google_container_id&&Za(window.google_container_id)||Za(a);if(!b&&!window.google_container_id&&a){document.write("<span id="+a+"></span>");b=Za(a)}return b},nd=/[+, ]/;window.google_render_ad=td;function Dd(){if(Tb&&typeof C.alternateShowAds=="function")C.alternateShowAds.call(i);else{Ad();Ub("show_ads.google_init_globals",xd,yd);Xc(window,document)}}Ub("show_ads.main",Wb,Dd);})()
