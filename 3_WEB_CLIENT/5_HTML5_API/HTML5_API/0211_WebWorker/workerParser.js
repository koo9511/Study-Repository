self.onmessage = function(event) {
    
    // ★★★★ JSON string
    var jsonText = event.data;
    
    // ★★★★ Parsing JSON
    var jsonObj = JSON.parse(jsonText);
    
    // ★★★★ JSON object 반환
    self.postMessage(jsonObj);
};