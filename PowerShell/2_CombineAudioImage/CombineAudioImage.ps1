#how this works#
#1.For the script to work please put your audio files and image files in the same directory#
#2.They should follow the format FileName1.mp3 , FileName1.jpg
#3.mp3 , jpg and whatever formats you include in the filters will be supported
#4.ffmpeg should be present on your machine

#location of audio and image files to be combined
$input_directory = "C:\Users\gaba\MyFiles"
#output directory for finished vidoes
$output_directory = "C:\Users\gaba\MyFiles"

$ffmpeg_dir = "C:\Users\gaba\Downloads\ffmpeg-4.3.2-2021-02-27-full_build\bin"
#audio types supported
$audio_types = "*mp3"

Get-ChildItem $input_directory -Include $audio_types -Recurse -File | ForEach-Object {
    $file_name = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    $filter = "$file_name*"
    $image_file = Get-ChildItem -Path $input_directory -Include *.jpg,*.png -Filter $filter -Force -Recurse -File | Select-Object -First 1
    #run ffmpeg
    $audio_input = $_.FullName
    $image_input = $image_file.FullName
    $video_output = "$output_directory\$file_name.mp4"
    $command = "$ffmpeg_dir\ffmpeg -loop 1 -i $image_input -i $audio_input -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest $video_output"
    Invoke-Expression $command
}