(this["webpackJsonptrx-mlm-smart-contract-20113748-react"]=this["webpackJsonptrx-mlm-smart-contract-20113748-react"]||[]).push([[4],{15:function(e,t,n){"use strict";n.d(t,"a",(function(){return u})),n.d(t,"b",(function(){return s}));var c=n(17),r=n(1),a=n(0),o=n(22),i=n.n(o),u=Object(a.createContext)();function s(e){var t=Object(a.useState)(!!window.localStorage.getItem("accessToken")),n=Object(c.a)(t,2),o=n[0],s=n[1],l=Object(a.useState)({}),j=Object(c.a)(l,2),b=j[0],d=(j[1],{userLoggedIn:o,userData:b,userLogIn:function(e,t){var n;(n=t)?(localStorage.setItem("accessToken",n),i.a.defaults.headers.common.Authorization="Bearer ".concat(n)):(localStorage.removeItem("accessToken"),delete i.a.defaults.headers.common.Authorization),s(e)}});return Object(r.jsx)(u.Provider,{value:d,children:e.children})}},26:function(e,t,n){"use strict";n.d(t,"b",(function(){return l})),n.d(t,"a",(function(){return j}));var c=n(1),r=n(25),a=n.n(r),o=n(45),i=n.n(o),u=n(46),s=n.n(u);function l(e){var t=e.active;return Object(c.jsx)(a.a,{active:t,spinner:Object(c.jsx)(i.a,{height:4,width:100,color:"#7CBC8C"})})}function j(e){var t=e.active;return Object(c.jsx)(a.a,{active:t,spinner:Object(c.jsx)(s.a,{size:100,color:"white"})})}},54:function(e,t,n){},76:function(e,t,n){},93:function(e,t,n){"use strict";n.r(t);var c=n(1),r=n(0),a=n.n(r),o=n(14),i=n.n(o),u=(n(54),n(43)),s=n(13),l=n(2),j=[{exact:!0,path:"/back-office-main",guard:!0,component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(1),n.e(11),n.e(7)]).then(n.bind(null,328))}))},{exact:!0,path:"/",component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(10)]).then(n.bind(null,329))}))},{exact:!0,path:"/login",component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(1),n.e(3),n.e(8)]).then(n.bind(null,325))}))},{exact:!0,path:"/registration",component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(1),n.e(2)]).then(n.bind(null,326))}))},{exact:!0,path:"/registration/:id",component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(1),n.e(2)]).then(n.bind(null,326))}))},{exact:!0,path:"/tutorial",component:Object(r.lazy)((function(){return Promise.all([n.e(0),n.e(3),n.e(9)]).then(n.bind(null,330))}))},{component:function(){return Object(c.jsx)(l.a,{to:"/"})}}],b=n(5),d=n(15);function h(e){var t=e.children;return Object(r.useContext)(d.a).userLoggedIn?Object(c.jsx)(c.Fragment,{children:t}):Object(c.jsx)(l.a,{to:"/"})}n(76),n(77),n(78);var O=n(26),m=Object(b.a)();var f=function(){return Object(c.jsx)("div",{id:"globalwrap",children:Object(c.jsx)(d.b,{children:Object(c.jsx)(s.a,{history:m,children:Object(c.jsx)(x,{data:j})})})})};function x(e){return Object(c.jsx)(r.Suspense,{fallback:Object(c.jsx)(O.b,{active:!0}),children:Object(c.jsx)(l.d,{children:e.data.map((function(e,t){var n=e.component,a=e.guard?h:r.Fragment;return Object(c.jsx)(l.b,{exact:e.exact,path:e.path,render:function(t){return Object(c.jsx)(a,{children:e.routes?Object(c.jsx)(x,{data:e.routes}):Object(c.jsx)(n,Object(u.a)({},t))})}},t)}))})})}var p=function(e){e&&e instanceof Function&&n.e(12).then(n.bind(null,327)).then((function(t){var n=t.getCLS,c=t.getFID,r=t.getFCP,a=t.getLCP,o=t.getTTFB;n(e),c(e),r(e),a(e),o(e)}))};i.a.render(Object(c.jsx)(a.a.StrictMode,{children:Object(c.jsx)(f,{})}),document.getElementById("root")),p()}},[[93,5,6]]]);
//# sourceMappingURL=main.8d813420.chunk.js.map