
class AESKey {

    [string]$Name
    [byte[]]$Key
    [int]$ByteLength

    AESKey([string]$name, [int]$byteLength){
        $this.Name = $name
        $this.ByteLength = $byteLength
        $this.Key = $this.NewKey()
    }

    hidden [byte[]] NewKey(){
        $random = [System.Security.Cryptography.RandomNumberGenerator]::Create()
        $buffer = New-Object byte[] $this.ByteLength
        $random.GetBytes($buffer)
        return $buffer
    }

    [string] ToString(){
        return "Name: $($this.Name), ByteLength: $($this.ByteLength),
        Key:$($this.Key)"
    }
}