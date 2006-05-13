/*

FILE DESCRIPTION:
Contains all javascript methods

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
20 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Added validateQuestions() to validate Add_setp2.jsp



TO DO:


*/

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function setSectionTitle(title){
	document.getElementById('SectionTitle').innerHTML += "<i>"+title+"</i>";
}

function validateQuestions(form)
{
	//alert(document.getElementsByName("selectedOption["+(0+1)+"]")[0].checked);
	
	var totalQuestions = 0;
	var myQuestions = form.getElementsByTagName("TEXTAREA");
	//var myOptions = (form.getElementsByTagName("INPUT").length -2)/2;
	var myOptionsCount = ((form.getElementsByTagName("INPUT").length)-4)/(2 * myQuestions.length);

		//alert(document.getElementById("question["+i+"]").value);

		for(var i=0; i < myQuestions.length; i++)
		{
			var mySelectedOption = -1;
			
			if(myQuestions[i].value.length == 0)
				continue;
			totalQuestions++;
			
			
			
			//get the number of the selectedOption
			for(var w = 0; w < myOptionsCount; w++)
			{
				var tempSelected = document.getElementsByName("selectedOption["+(i+1)+"]")[w];
				if(tempSelected.checked)
				{
					mySelectedOption = tempSelected.value;
					break;
				}
			}
			
			var isValid = false;
			var OptionCounter = 0;
			
			
			
			for(var j=0; j < myOptionsCount; j++)
			{
				var myOption = document.getElementsByName("option["+(i+1)+"]");
				if(myOption[j].value.length > 0)
				{
					OptionCounter++;
					if(mySelectedOption == (j+1))
						isValid = true;
				}
			}
			
			if(OptionCounter < 2 )
			{
				alert("You have enter less than 2 options in Question #"+(i+1));
				myQuestions[i].focus();
				return false;
			}
			
			if(mySelectedOption == -1)
			{
				alert("Please check the correct Option for Question#"+(i+1));
				myQuestions[i].focus();
				return false;
			}
			
			if(!isValid)
			{
				document.getElementsByName("option["+(i+1)+"]")[mySelectedOption-1].focus();
				alert("The selected Option for Question#"+(i+1)+" is not acceptable");
				return false;
			}
			
		}
		
		if(totalQuestions == 0)
		{
			alert("Please enter at least 1 question");
			myQuestions[0].focus();
			return false;
		}
		
		return true;
}

function checkAll(id)
{
	for(var i=0; i < document.getElementsByName(id).length; i++)
		document.getElementsByName(id)[i].checked = !document.getElementsByName(id)[i].checked;
}

function checkOne(id, message)
{
    for(var i=0; i < document.getElementsByName(id).length; i++)
        if(document.getElementsByName(id)[i].checked) 
            return true;
        alert(message);
        return false;
}
