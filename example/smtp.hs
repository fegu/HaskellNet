import System.IO
import HaskellNet.SMTP
import Text.Mime
import qualified Data.ByteString.Char8 as BS

smtpServer = "outmail.f2s.com"
sendFrom = "test@test.org"
sendTo = [""]

main = do
  con <- connectSMTP smtpServer
  let msg = ([("From", "HaskellNet <" ++ sendFrom ++ ">"),("Subject","Test")], BS.pack "\r\nhello from haskellnet")
  sendMail "robert.wills@dicta.org.uk" ["wrwills@gmail.com"] (BS.pack $ show $ showMessage "utf-8" msg) con
  closeSMTP con
         