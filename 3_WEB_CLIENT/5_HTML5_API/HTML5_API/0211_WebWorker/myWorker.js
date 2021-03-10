// ★★★★ Web page로부터 메세지 수신
self.onmessage = function(event) {
    // ★★★★ Web page로 메세지 송신
    self.postMessage(event.data + ' HTML5 교육 재미 있나요?');
};