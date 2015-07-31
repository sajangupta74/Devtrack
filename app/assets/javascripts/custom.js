function remove_first_option_dropdown()
{					
	var flag=0, flag2=0;
    $('#dd').on("click",function(){
    if(flag==0)
	{
	    console.log($('#dd option:first').remove());
	    flag=1;
    }
    });

    $('#mm').on("click",function(){
    if(flag2==0)
	{
	    console.log($('#mm option:first').remove());
	    flag2=1;
    }
    });
}