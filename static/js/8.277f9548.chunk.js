(this["webpackJsonptrx-mlm-smart-contract-20113748-react"]=this["webpackJsonptrx-mlm-smart-contract-20113748-react"]||[]).push([[8],{110:function(e,t,n){"use strict";t.a=n.p+"static/media/xtronlong.12848e6d.png"},113:function(e,t,n){"use strict";var a=n(99),c=n.n(a),r=n(108),s={tronWeb:!1,contract:!1,setTronWeb:function(e){var t=this;return Object(r.a)(c.a.mark((function n(){return c.a.wrap((function(n){for(;;)switch(n.prev=n.next){case 0:return t.tronWeb=e,n.next=3,e.contract().at("TQe5ExxEQpnBGBRkLu4mTDDGRLrudyugrD");case 3:t.contract=n.sent;case 4:case"end":return n.stop()}}),n)})))()}};t.a=s},114:function(e,t,n){"use strict";var a=n(1),c=(n(0),n(111));t.a=function(e){var t=e.autoClose,n=void 0===t?3e3:t;return Object(a.jsx)(c.a,{position:"top-center",autoClose:n,newestOnTop:!1,closeOnClick:!0,rtl:!1,pauseOnFocusLoss:!0})}},130:function(e,t){},131:function(e,t){},132:function(e,t){},133:function(e,t){},325:function(e,t,n){"use strict";n.r(t);var a=n(99),c=n.n(a),r=n(108),s=n(17),i=n(1),o=n(0),l=n(110),d=n(2),u=n(13),b=n(15),h=n(105),m=n(111),j=n(114),p=n(120),O=n.n(p),x=n(113),f=n(175);f.a.initialize("G-6MQ8JWRM63"),f.a.pageview(window.location.pathname+window.location.search);t.default=function(e){var t=e.location&&e.location.state,n=Object(d.g)(),a=Object(o.useContext)(b.a),p=Object(o.useState)(""),g=Object(s.a)(p,2),w=g[0],v=g[1],I=Object(o.useState)(!1),E=Object(s.a)(I,2),k=E[0],N=E[1],y=Object(o.useState)({installed:!1,loggedIn:!1}),L=Object(s.a)(y,2),T=(L[0],L[1]);Object(o.useEffect)(Object(r.a)(c.a.mark((function e(){return c.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:Object(r.a)(c.a.mark((function e(){return c.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,new Promise((function(e){var t={installed:!!window.tronWeb,loggedIn:window.tronWeb&&window.tronWeb.ready};if(t.installed)return T(t),e();var n=0,a=setInterval((function(){if(n>=10){var c=Object({NODE_ENV:"production",PUBLIC_URL:"",WDS_SOCKET_HOST:void 0,WDS_SOCKET_PATH:void 0,WDS_SOCKET_PORT:void 0,FAST_REFRESH:!0}).REACT_APP_NETWORK;return window.tronWeb=new O.a(c,c,c),T({installed:!1,loggedIn:!1}),clearInterval(a),e()}if(t.installed=!!window.tronWeb,t.loggedIn=window.tronWeb&&window.tronWeb.ready,!t.installed)return n++;clearInterval(a),T(t),e()}),100)}));case 2:return e.next=4,x.a.setTronWeb(window.tronWeb);case 4:N(!0);case 5:case"end":return e.stop()}}),e)})))();case 1:case"end":return e.stop()}}),e)}))),[]);var W=function(){return Object(i.jsx)("p",{children:"English"===t?Object(i.jsx)("span",{children:"To access XTRON you must install TronLink."}):Object(i.jsx)("span",{children:"Para acceder a XTRON debe instalar TronLink."})})},D=function(){var e=Object(r.a)(c.a.mark((function e(){var r;return c.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(""===w){e.next=22;break}if(!k){e.next=19;break}return e.prev=2,e.next=5,x.a.contract.idToAddress(w).call();case 5:r=e.sent,a.userLogIn(!0,"Login"),localStorage.removeItem("backOfficeID"),localStorage.setItem("backOfficeID",O.a.address.fromHex(r)),n.push({pathname:"/back-office-main",state:{lang:t}}),window.location.reload(!1),e.next=17;break;case 13:e.prev=13,e.t0=e.catch(2),m.b.error("Error"),console.log(e.t0);case 17:e.next=20;break;case 19:m.b.error(W);case 20:e.next=23;break;case 22:"English"===t?m.b.warn("Enter your ID"):m.b.warn("Introduzca su ID");case 23:case"end":return e.stop()}}),e,null,[[2,13]])})));return function(){return e.apply(this,arguments)}}(),S=function(){var e=Object(r.a)(c.a.mark((function e(){return c.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(""!==w)if(k)if(w.length>33)try{try{a.userLogIn(!0,"Login"),localStorage.removeItem("backOfficeID"),localStorage.setItem("backOfficeID",w),n.push({pathname:"/back-office-main",state:{lang:t}}),f.a.event({category:"User",action:"Successful Login"}),window.location.reload(!1)}catch(c){m.b.error("Error"),console.log(c)}}catch(c){alert.show("Wallet Error")}else m.b.error("Wallet invalida");else m.b.error(W);else"English"===t?m.b.warn("Enter your ID"):m.b.warn("Introduzca su ID");case 1:case"end":return e.stop()}}),e)})));return function(){return e.apply(this,arguments)}}();return Object(i.jsxs)("div",{className:"",id:"backofficewrap",children:[Object(i.jsx)(j.a,{}),Object(i.jsxs)("div",{className:"container",children:[Object(i.jsx)("div",{className:"text-center logo-payment-wrap",children:Object(i.jsx)(u.b,{to:{pathname:"/",state:t},className:"logo-payment-link",children:Object(i.jsx)("img",{className:"logo-payment",src:l.a,alt:"logo xtron"})})}),Object(i.jsx)("div",{className:"row ",id:"",children:Object(i.jsx)("div",{className:"",style:{width:"100%"},children:Object(i.jsx)("div",{className:"xwrap",children:Object(i.jsxs)("div",{className:"text-center registration-items",children:["English"===t?Object(i.jsx)("h2",{children:"Login Area"}):Object(i.jsx)("h2",{children:"\xc1rea de inicio de sesi\xf3n"}),"English"===t?Object(i.jsx)("h4",{children:"Enter your ID/Wallet to access your backoffice"}):Object(i.jsx)("h4",{children:"Ingrese su ID/Wallet para acceder a su backoffice"}),Object(i.jsxs)("div",{className:"login-switch-wrap",children:[Object(i.jsx)("button",{id:"method1btn",className:"switchbtn switchbtn-active",onClick:function(){return document.getElementById("method1btn").classList.add("switchbtn-active"),document.getElementById("method2btn").classList.remove("switchbtn-active"),document.getElementById("method1wrap").classList.remove("hide"),void document.getElementById("method2wrap").classList.add("hide")},children:"ID"}),Object(i.jsx)("button",{id:"method2btn",className:"switchbtn",onClick:function(){return document.getElementById("method1btn").classList.remove("switchbtn-active"),document.getElementById("method2btn").classList.add("switchbtn-active"),document.getElementById("method1wrap").classList.add("hide"),void document.getElementById("method2wrap").classList.remove("hide")},children:" TRX Wallet"})]}),Object(i.jsxs)("div",{id:"method1wrap",className:"login-method-1",children:[Object(i.jsx)("div",{className:"registration-input",children:Object(i.jsx)("input",{id:"customInput",name:"customInputName",type:"text",value:w,className:"sponsor-input-box text-center",onChange:function(e){return v(e.target.value)}})}),Object(i.jsx)("div",{className:"registration-btn",children:Object(i.jsx)("button",{className:"btn btn-success custombtn",onClick:function(){return D()},children:"LOGIN"})})]}),Object(i.jsxs)("div",{id:"method2wrap",className:"login-method-2 hide",children:[Object(i.jsx)("div",{className:"registration-input",children:Object(i.jsx)("input",{id:"customInput",name:"customInputName",type:"text",value:w,className:"sponsor-input-box text-center",onChange:function(e){return v(e.target.value)}})}),Object(i.jsx)("div",{className:"registration-btn",children:Object(i.jsx)("button",{className:"btn btn-success custombtn",onClick:function(){return S()},children:"LOGIN"})})]}),Object(i.jsx)("div",{className:"h20"}),"English"===t?Object(i.jsx)("h4",{children:"Don't have an account yet?"}):Object(i.jsx)("h4",{children:"\xbfA\xfan no tienes una cuenta?"}),"English"===t?Object(i.jsx)(u.b,{to:{pathname:"/registration",state:t},children:Object(i.jsxs)("h4",{children:[Object(i.jsx)(h.k,{}),"  Register"]})}):Object(i.jsx)(u.b,{to:{pathname:"/registration",state:t},children:Object(i.jsxs)("h4",{children:[Object(i.jsx)(h.k,{}),"  REGISTRO"]})})]})})})})]})]})}}}]);
//# sourceMappingURL=8.277f9548.chunk.js.map