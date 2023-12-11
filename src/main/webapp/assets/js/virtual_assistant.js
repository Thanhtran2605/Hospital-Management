const btn = document.querySelector('.talk');
const content = document.querySelector('.contents');

const voices = window.speechSynthesis.getVoices();
const vietnameseVoice = voices.find(voice => voice.lang === 'vi-VN');
this.voice = vietnameseVoice;

var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

var grammar = '#JSGF V1.0;'

var recognition = new SpeechRecognition();
var speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
recognition.lang = 'vi-VN';
recognition.interimResults = false;

recognition.onresult = function(event) {
	var lastResult = event.results.length - 1;
	var transcript = event.results[lastResult][0].transcript;
	content.textContent = transcript;
	speakThis(transcript.toLowerCase());
};

btn.addEventListener('click', () => {
	recognition.start();
})

function speakThis(message) {
	const speech = new SpeechSynthesisUtterance();

	const voices = window.speechSynthesis.getVoices();
	const vietnameseVoice = voices.find(voice => voice.lang === 'vi-VN');
	speech.voice = vietnameseVoice;

	speech.text = "Tôi không hiểu bạn nói gì, vui lòng thử lại";

	if (message.includes('xin') || message.includes('chào')) {
		const finalText = "Xin chào quý khách, bạn cần tôi giúp gì";
		speech.text = finalText;
	}

	else if (message.includes('ở') || message.includes('đâu') || message.includes('địa chỉ')) {
		const finalText = "Địa chỉ phòng khám y tế hiện tại đang ở số nhà 21, Quận Ngũ Hành Sơn, thành phố Đà Nẵng, Việt Nam";
		speech.text = finalText;
	}

	else if (message.includes('số') || message.includes('điện') || message.includes('gọi') || message.includes('thoại') || message.includes('liên')) {
		const finalText = "Vui lòng liên hệ đến số 0865578773 để được tư vấn và đặt lịch hẹn một cách sớm nhất";
		speech.text = finalText;
	}

	else if (message.includes('tên') || message.includes('phòng')) {
		window.open("https://google.com", "_blank");
		const finalText = "Tên phòng khám là Golden Health";
		speech.text = finalText;
	}

	else if (message.includes('đặt') || message.includes('lịch') || message.includes('khám')) {
		window.open("http://localhost:8080/HospitalSystem/user_appointment.jsp", "_blank");
		const finalText = "Tôi đã thực hiện chuyển hướng đến trang đặt lịch khám, vui lòng điền vào biểu mẫu để được đặt lịch sớm nhất";
		speech.text = finalText;
	}

	/*else if (message.includes('what is') || message.includes('who is') || message.includes('what are')) {
		window.open(`https://www.google.com/search?q=${message.replace(" ", "+")}`, "_blank");
		const finalText = "This is what i found on internet regarding " + message;
		speech.text = finalText;
	}
	
	else if (message.includes('wikipedia')) {
		window.open(`https://en.wikipedia.org/wiki/${message.replace("wikipedia", "")}`, "_blank");
		const finalText = "This is what i found on wikipedia regarding " + message;
		speech.text = finalText;
	}
	
	else if (message.includes('time')) {
		const time = new Date().toLocaleString(undefined, { hour: "numeric", minute: "numeric" })
		const finalText = time;
		speech.text = finalText;
	}
	
	else if (message.includes('date')) {
		const date = new Date().toLocaleString(undefined, { month: "short", day: "numeric" })
		const finalText = date;
		speech.text = finalText;
	}
	
	else if (message.includes('calculator')) {
		window.open('Calculator:///')
		const finalText = "Opening Calculator";
		speech.text = finalText;
	}*/

	else {
		/*window.open(`https://www.google.com/search?q=${message.replace(" ", "+")}`, "_blank");
		const finalText = "I found some information for " + message + " on google";*/
		speech.text = "Tôi không hiểu bạn nói gì, vui lòng thử lại";
	}

	speech.volume = 1;
	speech.pitch = 1;
	speech.rate = 1;

	window.speechSynthesis.speak(speech);
}