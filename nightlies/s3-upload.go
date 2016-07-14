package main

import (
	"flag"
	"log"
	"os"
	"strings"
	
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)

func main() {
	var flagKey = flag.String("key", "secretKey", "S3 secret key")
	var flagBucket = flag.String("bucket", "theBucket", "S3 bucket")
	var flagFile = flag.String("file", "upload_file.tar", "Upload file")
	
	flag.Parse()

	file, err := os.Open(*flagFile)
	if err != nil {
		log.Fatal("Failed to open file", err)
	}

	// Not required, but you could zip the file before uploading it
	// using io.Pipe read/writer to stream gzip'd file contents.
	// reader, writer := io.Pipe()
	// if *flagGzip == true {
	// 	go func() {
	// 		gw := gzip.NewWriter (writer)
	// 		io.Copy(gw, file)
			
	// 		file.Close()
	// 		gw.Close()
	// 		writer.Close()
	// 	}()
	// }
	config := aws.Config{Region: aws.String("us-west-1")}
	errors := true
	config.CredentialsChainVerboseErrors = &errors
	uploader := s3manager.NewUploader(session.New(&config))
	contentType := "application/octet-stream"
	if strings.HasSuffix(*flagFile, ".html") {
		contentType = "text/html"
	}
	result, err := uploader.Upload(&s3manager.UploadInput{
		Body:   file,
		Bucket: aws.String(*flagBucket),
		Key:    aws.String(*flagKey),
		ContentType: aws.String(contentType),
	})
	if err != nil {
		log.Fatalln("Failed to upload", err)
	}

	log.Println("Successfully uploaded to", result.Location)
}
