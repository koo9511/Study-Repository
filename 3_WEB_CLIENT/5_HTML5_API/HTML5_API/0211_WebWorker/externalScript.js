// ★★★★ 외부 script 파일 불러오기
importScripts('script1.js', 'script2.js');

self.onmessage = function(event) {
    self.postMessage(event.data + ' HTML5 교육 재미 있나요?');
};