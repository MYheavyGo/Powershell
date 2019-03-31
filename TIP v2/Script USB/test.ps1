[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'PC Name'
$msg   = 'Enter the PC Name on the label behind:'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)