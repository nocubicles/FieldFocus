Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Ready','');

function SetFocusOnField(fieldNo)
{
    window.parent.document.querySelector(`[controlname^='${fieldNo}'] input`).focus()
}