function Get-ScmCommands
{
    $commands = @{}

    $commands.initialcheckout = {
        git clone $config.repository code

        If($config.branch) {
            cd code
            git checkout $config.branch
            cd ..
        }
    }

    $commands.updatecode = {
        $branch = "master"

        If($config.branch) {
            $branch = $config.branch
        }

        cd code
        git pull origin $branch
        git checkout $branch
        cd ..
    }

    return $commands
}

