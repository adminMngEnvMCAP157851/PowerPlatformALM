param(
    [Parameter(
        Mandatory=$True)]
    [ValidateSet(
    'Development',
    'Staging',
    'Production'
    )]
    [string]$env,
    [string]$solutionName,
    [string]$commitMessage,
    [string]$branch
)
switch($env)
{
    'Development'
    {
        $orgURL = 'https://org1b29da34.crm.dynamics.com'
    }
    'Staging'
    {
        $orgURL = 'https://org12a26e6e.crm.dynamics.com/'
        
    }
    'Production'
    {
        $orgURL = ''
    }
}
$outputPath = 'solutions'
$srcPath = 'src'
<<<<<<< HEAD
if($branch -ne '')
{
    git checkout -b $branch

}
else 
{
    git checkout "main"
}
pac auth create --url $orgURL
pac solution export --name ($solutionName) --path  ($outputPath + '\' + $solutionName +'.zip') -ow
pac solution export --name ($solutionName) --path  ($outputPath  + '\' + $solutionName +'_managed.zip') -m -ow
pac solution unpack -z ($outputPath+'\' +$solutionName + '.zip') -f ($srcPath +'\' + $solutionName ) -p both -pca
pac auth clear


git add ($srcPath +'\' + $solutionName + '\*')
git commit -m $commitMessage
if($branch -ne '')
{
    git push --set-upstream to=orgin/main
}
else {
    git push
}
=======
pac auth create --url $orgURL
pac solution export --name ($solutionName) --path  ($outputPath + '\' + $solutionName +'.zip') -ow
pac solution export --name ($solutionName) --path  ($outputPath  + '\' + $solutionName +'_managed.zip') -m -ow
pac solution unpack -z ($outputPath+'\' +$solutionName + '.zip') -f ($srcPath +'\' + $solutionName )-p both -pca
pac auth clear

>>>>>>> release/0.1
