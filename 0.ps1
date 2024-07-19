Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "弹球游戏"
$form.Width = 800
$form.Height = 600

$ball = New-Object System.Windows.Forms.Panel
$ball.Width = 20
$ball.Height = 20
$ball.BackColor = [System.Drawing.Color]::Red
$form.Controls.Add($ball)

$speedX = 4
$speedY = 4

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 30

$timer.Add_Tick({
    $ball.Location = [System.Drawing.Point]::new($ball.Location.X + $speedX, $ball.Location.Y + $speedY)
    
    if ($ball.Location.X - 0 -gt $form.ClientSize.Width - $ball.Width - 0) { 
        $speedX = -$speedX 
    }
    if ($ball.Location.Y - 0 -gt $form.ClientSize.Height - $ball.Height - 0) { 
        $speedY = -$speedY 
    }
    if ($ball.Location.X - 0 -lt 0) { 
        $speedX = -$speedX 
    }
    if ($ball.Location.Y - 0 -lt 0) { 
        $speedY = -$speedY 
    }
})

$form.Add_Shown({ $timer.Start() })

$form.ShowDialog()
