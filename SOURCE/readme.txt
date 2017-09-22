HISTORY SPEECHES readme.txt
jonathan.robles@aenetworks.com
==========================================


CONFIGURATION
------------------------------------------
configuration data: 'http://configs.ott.aetnd.com/alexa/config.json?usenew=yep'
configuration data (backup s3): 's3.amazonaws.com/test-alexa-history-speeches/config.json'

SPEECHES DATA
------------------------------------------
speech data: 'http://configs.ott.aetnd.com/alexa/data.json?usenew=yep'
speech data (backup s3): 's3.amazonaws.com/test-alexa-history-speeches/data.json'

LAMBDA FUNCTION
------------------------------------------
ARN - arn:aws:lambda:us-east-1:321543719502:function:HistorySpeeches



TODO: the lambda function needs to be whitelisted w/the signature server, currently it is using an open proxy for the chromecast (aetn.ott.chromecast) to obtain the signature token.  After this is done, all "getSignaturewithProxy" functions can be replaced with "getSignature" in the lambda function