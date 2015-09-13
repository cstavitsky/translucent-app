// EmailWidget = function(body, addressee_name){
// 	this.body = body;
// 	this.addressee_name = addressee_name
// }

// EmailWidget.prototype.fillAddresseeNameOutput = function(input){
// 	this.addressee_name = input;
// }

// EmailWidget.prototype.fillAddresseeEmailOutput = function(input){
// 	this.addressee_email = input;
// }

// EmailWidget.prototype.fillAddresseeNameOutput = function(input){
// 	this.addressee_name = input;
// }

// function NewEmailWidgetView(element, model){
// 	this.element = element.;
// 	this.model = model;
// 	element.on("keyup", this.onBodyChange.bind(this));
// }

// NewEmailWidgetView.prototype.onBodyChange = function(){
// 	var emailInput = $("#email").val();
// 	var nameInput = $("#name").val();
// 	this.model.fillAddresseeNameOutput(emailInput);
// 	this.model.fillAddresseeEmailOutput(nameInput);
// }

    function bossNameKeyPress()
    {
        var bossName = document.getElementById("boss-name");
        var output = bossName.value;
    
        var bossNameOutput = document.getElementById("boss-name-output");
        bossNameOutput.innerText = "Hi "+output+",";
    
        //var s = $("#edValue").val();
        //$("#lblValue").text(s);    
    }

     function bossEmailKeyPress()
    {
        var bossEmail = document.getElementById("boss-email");
        var output = bossEmail.value;
    
        var bossEmailOutput = document.getElementById("boss-email-output");
        bossEmailOutput.innerText = "(To: "+output+")";
    
        //var s = $("#edValue").val();
        //$("#lblValue").text(s);    
    }

      function subjectLineKeyPress()
    {
        var subjectLine = document.getElementById("subject-line");
        var output = subjectLine.value;
    
        var subjectLineOutput = document.getElementById("subject-line-output");
        subjectLineOutput.innerText = "(Subject line: "+output+")";
    
        //var s = $("#edValue").val();
        //$("#lblValue").text(s);    
    }


    MarkdownWidget = function(body){
  this.body = body;
}

MarkdownWidget.prototype.fillOutput = function(input){
  this.body = input
}

MarkdownWidget.prototype.checkStyle = function(input){
  if (input.match(/[,]$/)){
    return "<li>".concat(input.slice(0,-1)).concat("</li><br>");
    // $(this).checkStyle();
  } 
    return input
}


function NewMarkdownWidgetView(element, model){
  this.element = element;
  this.model = model;
  //should do this for distinct words
  element.on("keyup", this.onBodyChange.bind(this));
  // element.checkIfWord//if keycode == space
}

NewMarkdownWidgetView.prototype.onBodyChange = function(){
  console.log(this)
    var input = []
    var inputArray = $(this.element).val().split(" ");
    inputArray.forEach(function(word){
      input.push(this.model.checkStyle(word));
    }.bind(this));
    var output = input.join(" ")
    this.model.fillOutput(output)
    var currentModel = this.element
    if (currentModel.selector === "#text"){
    	$("#output").html(this.model.body)
    }else if (currentModel.selector === "#text2"){
    	$("#output2").html(this.model.body)
    }
  }


$(document).on("ready", function(){
  var widget = new MarkdownWidget("")
  var view = new NewMarkdownWidgetView($("#text"), widget)

  var widget2 = new MarkdownWidget("")
  var view2 = new NewMarkdownWidgetView($("#text2"), widget2)

  })