import { AppAttest } from 'app-attest';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    AppAttest.echo({ value: inputValue })
}
