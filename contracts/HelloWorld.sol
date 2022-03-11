// SPDX-license-Identifier: MIT
pragma solidity >=0.5.2;

contract HelloWorld {

    event EmitMessage(string message);

    string public message;

    constructor(string memory initMessage) public {
        message = initMessage;
    }

    function updateMessage(string memory newMessage) public {
        message = newMessage;
    }

    function sayMessage() public {
        emit EmitMessage(message);
    }

    function sayMessage(string memory recipient) public {
        bytes memory _bmessage = bytes(message);
        bytes memory _brecipient = bytes(recipient);

        string memory finalMessage = new string(_bmessage.length + _brecipient.length + 1);
        bytes memory _bFinalMessage = bytes(finalMessage);

        uint k = 0;
        for (uint i = 0; i < _bmessage.length; i++) _bFinalMessage[k++] = _bmessage[i];
        _bFinalMessage[k++] = ' ';
        for (uint i = 0; i < _brecipient.length; i++) _bFinalMessage[k++] = _brecipient[i];

        emit EmitMessage(string(_bFinalMessage));
   }
}