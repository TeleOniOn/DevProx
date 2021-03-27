------------------------------------------------
-- This Source Was Developed By (MeM) @IVEN4.--
--   This Is The Source Channel @Src_Web .   --
--                - AlomDa -                 --
--        -- https://t.me/Src_Web --         --
------------------------------------------------ 
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
DevAbs = redis.connect('127.0.0.1', 6379) 
User = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
ServerDevProx = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
Ip = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source AlOmDa     --
local AutoSet = function() 
if not DevAbs:get(ServerDevProx.."IdDevProx") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevAbs:set(ServerDevProx.."IdDevProx",DevId) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end 
os.execute('lua DevProx.lua') 
end 
if not DevAbs:get(ServerDevProx.."TokenDevProx") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevAbs:set(ServerDevProx.."TokenDevProx",TokenBot) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end  
os.execute('lua DevProx.lua') 
end 
DevAbs:set(DevAbs:get(ServerDevProx.."TokenDevProx"):match("(%d+)")..'Abs:Errors',true)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAbs:get(ServerDevProx.."IdDevProx"),
TokenBot = DevAbs:get(ServerDevProx.."TokenDevProx"),
DevProx = DevAbs:get(ServerDevProx.."TokenDevProx"):match("(%d+)"),
SudoIds = {DevAbs:get(ServerDevProx.."IdDevProx")},
}
Create(Config, "./config.lua")   
file = io.open("DevProx.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DevProx
token="]]..DevAbs:get(ServerDevProx.."TokenDevProx")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./DevProx.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DevProx
while(true) do
rm -fr ../.telegram-cli
screen -S DevProx -X kill
screen -S DevProx ./DevProx.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_DevProx = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAbs:del(ServerDevProx.."IdDevProx");DevAbs:del(ServerDevProx.."TokenDevProx")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_DevProx() 
print("\27[36m"..[[                                           
|-------------------------------------------|
|This Source Was Developed By (MeM) @IVEN4.|
|  This Is The Source Channel @Src_Web .   |
|               - AlomDa -                 |
---------------------------------------------
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId or Config.SUDO
SudoIds = {Config.SudoIds,1422493638} or {Config.sudo_users,1422493638}
DevProx = Config.DevProx or Config.bot_id
TokenBot = Config.TokenBot or Config.token
NameBot = (DevAbs:get(DevProx..'Abs:NameBot') or 'لوز')
--     Source AlOmDa     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source AlOmDa     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source AlOmDa     --
function dl_cb(arg, data)
end
--     Source AlOmDa     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source AlOmDa     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(DevProx) then  
var = true  
end  
return var  
end 
--     Source AlOmDa     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
------ VIP MEMBER ALL ------
function VipAll(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
----   AbsConstructor   ----
function AbsConstructor(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:AbsConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAbs:sismember(DevProx..'Abs:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source AlOmDa     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAbs:sismember(DevProx..'Abs:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source AlOmDa     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAbs:sismember(DevProx..'Abs:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source AlOmDa     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAbs:sismember(DevProx..'Abs:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source AlOmDa     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAbs:sismember(DevProx..'Abs:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source AlOmDa     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source AlOmDa     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source AlOmDa     --
function DevProxFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.DevProx and msg then
FilesText = plugin.DevProx(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source AlOmDa     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source AlOmDa     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= DevProx:lower() then 
send(chat,msg.id_,"࿈ 𖡻 عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"࿈ 𖡻 جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"࿈ 𖡻 عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..DevProx..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAbs:set(DevProx.."Abs:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAbs:sadd(DevProx.."Abs:Groups",IdGps) 
DevAbs:set(DevProx.."Abs:Lock:Bots"..IdGps,"del") DevAbs:hset(DevProx.."Abs:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbs:set(DevProx..Lock..IdGps,true)
end
if v.AbsConstructors then
for k,IdAbsConstructors in pairs(v.AbsConstructors) do
DevAbs:sadd(DevProx..'Abs:AbsConstructor:'..IdGps,IdAbsConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAbs:sadd(DevProx..'Abs:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAbs:sadd(DevProx..'Abs:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAbs:sadd(DevProx..'Abs:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAbs:sadd(DevProx..'Abs:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAbs:set(DevProx.."Abs:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAbs:set(DevProx.."Abs:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"࿈ 𖡻 تم رفع النسخه بنجاح \n࿈ 𖡻 تم تفعيل جميع المجموعات \n࿈ 𖡻 تم استرجاع مشرفين المجموعات \n࿈ 𖡻 تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source AlOmDa     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source AlOmDa     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     Source AlOmDa     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source AlOmDa     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source AlOmDa     --
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source AlOmDa     --
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--     Source AlOmDa     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source AlOmDa     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source AlOmDa     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source AlOmDa     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source AlOmDa     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source AlOmDa     --
function Dev_Abs(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source AlOmDa     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source AlOmDa     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source AlOmDa     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source AlOmDa     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source AlOmDa     --
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source AlOmDa     --
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
--     Source AlOmDa     --
local AbsRank = function(msg) if SudoId(msg.sender_user_id_) then DevProxTEAM  = "المطور" elseif SecondSudo(msg) then DevProxTEAM = "المطور" elseif SudoBot(msg) then DevProxTEAM = "المطور" elseif ManagerAll(msg) then DevProxTEAM = "المدير" elseif AdminAll(msg) then DevProxTEAM = "الادمن" elseif AbsConstructor(msg) then DevProxTEAM = "المنشئ" elseif BasicConstructor(msg) then DevProxTEAM = "المنشئ" elseif Constructor(msg) then DevProxTEAM = "المنشئ" elseif Manager(msg) then DevProxTEAM = "المدير" elseif Admin(msg) then DevProxTEAM = "الادمن" else DevProxTEAM = "العضو" end return DevProxTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1422493638) then DevProxTEAM = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(DevProx) then DevProxTEAM = 'البوت' elseif SudoId(user_id) then DevProxTEAM = 'المطور الاساسي' elseif DevAbs:sismember(DevProx..'Abs:SecondSudo:', user_id) then DevProxTEAM = 'المطور الثانوي' elseif DevAbs:sismember(DevProx..'Abs:SudoBot:', user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:SudoBot:Rd"..chat_id) or 'المطور' elseif DevAbs:sismember(DevProx..'Abs:ManagerAll:', user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:Managers:Rd"..chat_id) or 'المدير العام' elseif DevAbs:sismember(DevProx..'Abs:AdminAll:', user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevAbs:sismember(DevProx..'Abs:VipAll:', user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevAbs:sismember(DevProx..'Abs:AbsConstructor:'..chat_id, user_id) then DevProxTEAM = 'منشئ المجموعه' elseif DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..chat_id, user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevAbs:sismember(DevProx..'Abs:Constructor:'..chat_id, user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevAbs:sismember(DevProx..'Abs:Managers:'..chat_id, user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:Managers:Rd"..chat_id) or 'المدير' elseif DevAbs:sismember(DevProx..'Abs:Admins:'..chat_id, user_id) then DevProxTEAM = DevAbs:get(DevProx.."Abs:Admins:Rd"..chat_id) or 'الادمن' elseif DevAbs:sismember(DevProx..'Abs:VipMem:'..chat_id, user_id) then  DevProxTEAM = DevAbs:get(DevProx.."Abs:VipMem:Rd"..chat_id) or 'المميز' elseif DevAbs:sismember(DevProx..'Abs:Cleaner:'..chat_id, user_id) then  DevProxTEAM = DevAbs:get(DevProx.."Abs:Cleaner:Rd"..chat_id) or 'المنظف' else DevProxTEAM = DevAbs:get(DevProx.."Abs:mem:Rd"..chat_id) or 'العضو' end return DevProxTEAM end
--     Source AlOmDa     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(DevProx) then  
var = true  
elseif DevAbs:sismember(DevProx..'Abs:SecondSudo:', user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:SudoBot:', user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:ManagerAll:', user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:AdminAll:', user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:VipAll:', user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:AbsConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(DevProx..'Abs:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:Managers:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:Admins:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(DevProx..'Abs:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AbsDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAbs:sismember(DevProx..'Abs:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAbs:sismember(DevProx..'Abs:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAbs:sismember(DevProx..'Abs:AbsConstructor:'..chat_id, user_id) then
var = 'absconstructor'
elseif DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAbs:sismember(DevProx..'Abs:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAbs:sismember(DevProx..'Abs:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source AlOmDa     --
local function Filters(msg, value)
local abs = (DevProx..'Abs:Filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "Dev_Prox")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source AlOmDa     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Abs = GetInfo.result.custom_title
else 
Abs = Status
end
end
return Abs
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'࿈ 𖡻 مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'࿈ 𖡻 مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'࿈ 𖡻 الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'࿈ 𖡻 صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 حذف الرسائل ↫ '..DEL..'\n࿈ 𖡻 دعوة المستخدمين ↫ '..INV..'\n࿈ 𖡻 حظر المستخدمين ↫ '..BAN..'\n࿈ 𖡻 تثبيت الرسائل ↫ '..PIN..'\n࿈ 𖡻 تغيير المعلومات ↫ '..EDT..'\n࿈ 𖡻 اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end
end
end
--     Source AlOmDa     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Abs = GetInfo.result.bio
else 
Abs = "لا يوجد"
end
end
return Abs
end
--     Source AlOmDa     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source AlOmDa     --
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbs:get(DevProx..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source AlOmDa     --
function ChCheck(msg)
local var = true 
if DevAbs:get(DevProx.."DevAbs2") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAbs:get(DevProx..'DevAbs2')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAbs:get(DevProx..'Abs:textch:user') then
local textchuser = DevAbs:get(DevProx..'Abs:textch:user')
send(msg.chat_id_,msg.id_,'['..textchuser..']')
else
send(msg.chat_id_,msg.id_,"࿈ 𖡻 عليك الاشتراك في قناة البوت \n࿈ 𖡻 قناة البوت ↫ ["..DevAbs:get(DevProx..'DevAbs3').."]")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAbs:get(DevProx..'yes'..data.sender_user_id_) == 'delyes' then
DevAbs:del(DevProx..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(DevProx..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAbs:get(DevProx..'no'..data.sender_user_id_) == 'delno' then
DevAbs:del(DevProx..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(DevProx..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم الغاء امر اطردني") 
end
--     Source AlOmDa     --
if DataText == '/yesdel' and DevAbs:get(DevProx..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAbs:del(DevProx..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(DevProx..'nodel'..data.sender_user_id_, 'delno')
if DevAbs:sismember(DevProx..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(DevProx..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevAbs:sismember(DevProx..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(DevProx..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(DevProx..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevAbs:sismember(DevProx..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevAbs:sismember(DevProx..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(DevProx..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(DevProx..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(DevProx..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(DevProx..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(DevProx..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAbs:srem(DevProx..'Abs:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Admins:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(DevProx..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم تنزيلك من ↫ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAbs:get(DevProx.."Abs:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم الغاء امر تغير المطور الاساسي") 
DevAbs:del(DevProx.."Abs:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAbs:get(DevProx.."Abs:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 المطور الجديد ↫ ["..CatchName(dp.first_name_,15).."](tg://user?id="..dp.id_..")\n࿈ 𖡻 تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"࿈ 𖡻 بواسطة ↫ ["..CatchName(dp.first_name_,15).."](tg://user?id="..dp.id_..")\n࿈ 𖡻 لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
DevProx = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAbs:del(DevProx.."Abs:NewDev"..data.sender_user_id_)
dofile('DevProx.lua') 
end
end
if DataText == '/nodel' and DevAbs:get(DevProx..'nodel'..data.sender_user_id_) == 'delno' then
DevAbs:del(DevProx..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(DevProx..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevAbs:get(DevProx.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAbs:smembers(DevProx..'Abs:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAbs:del(DevProx..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(DevProx.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 *صاحب الحظ* ↫ ["..UserName.."]\n࿈ 𖡻 *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevAbs:del(DevProx..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(DevProx.."Abs:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAbs:del(DevProx.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "࿈ 𖡻 تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevAbs:smembers(DevProx..'Abs:ListRolet'..data.chat_id_) 
local Text = '࿈ 𖡻 قائمة الاعبين ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n' 
local Textt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = msg.content_.text_ 
if text and DevAbs:get(DevProx.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbs:get(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbs:del(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbs:del(DevProx.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:srem(DevProx.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لايوجد امر بهذا الاسم", 1, 'html')
end
DevAbs:del(DevProx.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAbs:get(DevProx..'Abs:NameBot') or "لوز")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAbs:get(DevProx..'Abs:NameBot') or "لوز")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAbs:get(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAbs:get(DevProx.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbs:set(DevProx.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل الامر الجديد", 1, 'html')
DevAbs:del(DevProx.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbs:set(DevProx.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbs:get(DevProx.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbs:get(DevProx.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:set(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbs:sadd(DevProx.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الامر", 1, 'html')
DevAbs:del(DevProx.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(DevProx.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "࿈ 𖡻 قائمة الاوامر المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
Cmds = DevAbs:get(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "࿈ 𖡻 لاتوجد اوامر مضافه في المجموعه"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(DevProx.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(DevProx.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbs:del(DevProx.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAbs:set(DevProx.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAbs:set(DevProx.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source AlOmDa     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "࿈ 𖡻 قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
var = DevAbs:get(DevProx.."Comd:New:rt:Abs:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." • ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevAbs:smembers(DevProx.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(DevProx.."Comd:New:rt:Abs:"..v..msg.chat_id_)
DevAbs:del(DevProx.."Coomds"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbs:set(DevProx.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbs:sadd(DevProx.."Coomds"..msg.chat_id_,ComdNew)  
DevAbs:setex(DevProx.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n࿈ 𖡻 ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAbs:del(DevProx.."Comd:New:rt:Abs:"..ComdNew..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف الصلاحيه", 1, 'html')
end
if DevAbs:get(DevProx.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء الامر", 1, 'html')
DevAbs:del(DevProx.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n࿈ 𖡻 ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تستطيع اضافة صلاحية ( عضو • مميز )\n࿈ 𖡻 ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تستطيع اضافة صلاحية ( عضو )\n࿈ 𖡻 ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbs:get(DevProx.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbs:set(DevProx.."Comd:New:rt:Abs:"..textn..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اضافة الصلاحيه", 1, 'html')
DevAbs:del(DevProx.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevAbs:sismember(DevProx.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(DevProx.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAbs:sadd(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAbs:sadd(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevAbs:sismember(DevProx.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(DevProx.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbs:sismember(DevProx.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(DevProx.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:set(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbs:sismember(DevProx.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(DevProx.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:del(DevProx.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n࿈ 𖡻 تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source AlOmDa     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAbs:incr(DevProx..'Abs:UsersMsgs'..DevProx..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(DevProx..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAbs:sismember(DevProx.."Abs:Users",msg.chat_id_) then
DevAbs:sadd(DevProx.."Abs:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source AlOmDa     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '࿈ 𖡻 مرحبا عزيزي المطور \n࿈ 𖡻 انت المطور الاساسي هنا \n࿈ 𖡻 اليك ازرار سورس تيم العمده \n࿈ 𖡻 تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث ⌁','وضع كليشه المطور'},
{'↫ المطورين ⌁','↫ الاحصائيات ⌁'},
{'↫ المجموعات ⌁','روابط الكروبات','↫ المشتركين ⌁'},
{'↫ تعطيل التواصل ⌁','↫ تفعيل التواصل ⌁'},
{'تنظيف الكروبات','↫ قائمه العام ⌁','تنظيف المشتركين'},
{'↫ تغير المطور الاساسي ⌁'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'↫ تغير معلومات الترحيب ⌁'},
{'↫ تعطيل المغادره ⌁','↫ تفعيل المغادره ⌁'},
{'↫ تعطيل الاذاعه ⌁','↫ تفعيل الاذاعه ⌁'},
{'↫ اذاعه بالتثبيت ⌁'},
{'↫ اذاعه عام ⌁','↫ اذاعه خاص ⌁'},
{'↫ اذاعه عام بالتوجيه ⌁','↫ اذاعه خاص بالتوجيه ⌁'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'تحديث السورس'},
{'↫ حذف رد عام ⌁','↫ الردود العام ⌁','↫ اضف رد عام ⌁'},
{'↫ حذف رد الخاص ⌁','↫ تعيين رد الخاص ⌁'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '࿈ 𖡻 اهلا بك مجددا عزيزي المطور \n࿈ 𖡻 اليك الازرار الخاصه بتعديل وتغيير كلايش سورس تيم العمده فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAbs:get(DevProx..'Abs:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="⌁ المطور .",url="t.me/"..(dp.username_ or "Dev_Prox")}}}
local start = DevAbs:get(DevProx.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "࿈ 𖡻 مرحبا انا بوت اسمي "..NameBot.."\n࿈ 𖡻 اختصاصي حماية المجموعات\n࿈ 𖡻 من التفليش والسبام والخخ .. . ،\n࿈ 𖡻 تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n࿈ 𖡻 سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAbs:setex(DevProx..'Abs:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source AlOmDa     --
if not SecondSudo(msg) and not DevAbs:sismember(DevProx..'Abs:Ban:Pv',msg.sender_user_id_) and not DevAbs:get(DevProx..'Abs:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Abs(msg.sender_user_id_, msg.id_, 1, '࿈ 𖡻 تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "Dev_Prox")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'࿈ 𖡻 تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '࿈ 𖡻 العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n࿈ 𖡻 تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:sadd(DevProx..'Abs:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '࿈ 𖡻 العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n࿈ 𖡻 تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:srem(DevProx..'Abs:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Abs(id_user, 0, 1, text, 1, "md")  
Text = '࿈ 𖡻 تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '࿈ 𖡻 تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '࿈ 𖡻 تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '࿈ 𖡻 تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '࿈ 𖡻 تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source AlOmDa     --
if text and DevAbs:get(DevProx..'Abs:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAbs:del(DevProx..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAbs:set(DevProx.."Abs:Start:Bot",text)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ كليشة الستارت', 1, 'md')
DevAbs:del(DevProx..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌁' then 
DevAbs:set(DevProx..'Abs:Start:Bots'..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌁' then 
DevAbs:del(DevProx..'Start:Bot') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevAbs:get(DevProx.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "࿈ 𖡻 مرحبا انا بوت اسمي "..NameBot.."\n࿈ 𖡻 اختصاصي حماية المجموعات\n࿈ 𖡻 من التفليش والسبام والخخ .. . ،\n࿈ 𖡻 تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n࿈ 𖡻 سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌁' then   
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌁' then  
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Texting:Pv',true) 
end
end
--     Source AlOmDa     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAbs:incr(DevProx..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(DevProx.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAbs:get(DevProx.."Abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(DevProx) then 
DevAbs:srem(DevProx.."Abs:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) then
SendText(DevId,"࿈ 𖡻 تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 بواسطة ↫ "..Name.."\n࿈ 𖡻 اسم المجموعه ↫ ["..NameChat.."]\n࿈ 𖡻 ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الوقت ↫ "..os.date("%I:%M%p").."\n࿈ 𖡻 التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAbs:incr(DevProx..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAbs:incr(DevProx..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source AlOmDa     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:FreeBot'..DevProx) then
if ChatType == 'pv' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
DevAbs:del(DevProx..'Abs:AbsConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(DevProx.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:sadd(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(DevProx.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:srem(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbs:sismember(DevProx..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAbs:get(DevProx..'Abs:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عدد اعضاء المجموعه اقل من ↫ *'..(DevAbs:get(DevProx..'Abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","࿈ 𖡻 تم تفعيل المجموعه "..dp.title_)  
DevAbs:sadd(DevProx.."Abs:Groups",msg.chat_id_)
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(DevProx.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"࿈ 𖡻 تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 بواسطة ↫ "..Name.."\n࿈ 𖡻 موقعه في المجموعه ↫ "..status.."\n࿈ 𖡻 اسم المجموعه ↫ ["..NameChat.."]\n࿈ 𖡻 عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n࿈ 𖡻 ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n࿈ 𖡻 رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الوقت ↫ "..os.date("%I:%M%p").."\n࿈ 𖡻 التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source AlOmDa     --
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source AlOmDa     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAbs:set(DevProx..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source AlOmDa     --
local ReFalse = tostring(msg.chat_id_)
if not DevAbs:sismember(DevProx.."Abs:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False [ Not Enable ]")
return false
end
--     Source AlOmDa     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAbs:get(DevProx.."Abs:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAbs:smembers(DevProx.."Abs:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAbs:smembers(DevProx.."Abs:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAbs:smembers(DevProx.."Abs:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source AlOmDa     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     Source AlOmDa     --
if text and text:match("^(.*)$") then
local DelGpRed = DevAbs:get(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if DelGpRed == 'DelGpRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:srem(DevProx..'Abs:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAbs:get(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(DevProx.."Abs:Gif:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Voice:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Audio:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Photo:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Stecker:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Video:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:File:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Text:AllRed"..msg.content_.text_)
DevAbs:del(DevProx.."Abs:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source AlOmDa     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAbs:get(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevAbs:get(DevProx..'DelManagerRep'..msg.chat_id_..'')
DevAbs:srem(DevProx..'Abs:Manager:GpRed'..msg.chat_id_..'',DelManagerRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(DevProx..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_)
DevAbs:del(DevProx..'DelManagerRep'..msg.chat_id_..'')
return false
end
DevAbs:del(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
local SaveGpRed = DevAbs:get(DevProx..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevAbs:set(DevProx..'Abs:Video:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAbs:set(DevProx..'Abs:File:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAbs:set(DevProx..'Abs:Stecker:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAbs:set(DevProx..'Abs:Voice:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAbs:set(DevProx..'Abs:Audio:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(DevProx..'Abs:Photo:GpRed'..SaveGpRed..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevAbs:set(DevProx..'Abs:Gif:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAbs:set(DevProx..'Abs:Text:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(DevProx..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(DevProx..'DelManagerRep'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevAbs:get(DevProx..'Abs:Lock:GpRed'..msg.chat_id_) then 
if DevAbs:get(DevProx..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx..'Abs:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(DevProx..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx..'Abs:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(DevProx..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'Abs:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(DevProx..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'Abs:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(DevProx..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'Abs:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(DevProx..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx..'Abs:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(DevProx..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx..'Abs:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevAbs:get(DevProx..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then
function DevProxTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(DevProx..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(DevProx..'Abs:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, DevProxTEAM)
end
end
--     Source AlOmDa     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAbs:get(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevAbs:get(DevProx..'DelSudoRep')
DevAbs:del(DevProx.."Abs:Sudo:AllRed",DelSudoRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(DevProx.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(DevProx.."DelSudoRep")
return false
end
DevAbs:del(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAbs:get(DevProx.."Abs:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbs:set(DevProx.."Abs:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAbs:set(DevProx.."Abs:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAbs:set(DevProx.."Abs:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAbs:set(DevProx.."Abs:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAbs:set(DevProx.."Abs:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(DevProx.."Abs:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAbs:set(DevProx.."Abs:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAbs:set(DevProx.."Abs:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(DevProx.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(DevProx..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAbs:get(DevProx..'Abs:Lock:AllRed'..msg.chat_id_) then
if DevAbs:get(DevProx.."Abs:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx.."Abs:Video:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx.."Abs:File:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."Abs:Voice:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."Abs:Audio:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."Abs:Photo:AllRed"..msg.content_.text_))
end
if  DevAbs:get(DevProx.."Abs:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(DevProx.."Abs:Gif:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(DevProx.."Abs:Stecker:AllRed"..msg.content_.text_))
end
if DevAbs:get(DevProx.."Abs:Text:AllRed"..msg.content_.text_) then
function DevProxTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(DevProx..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(DevProx.."Abs:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, DevProxTEAM)
end
end 
--     Source AlOmDa     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '࿈ 𖡻 العضو ↫ '..GetName..' \n࿈ 𖡻 قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAbs:sismember(DevProx..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '࿈ 𖡻 العضو ↫ '..GetName..' \n࿈ 𖡻 قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAbs:sadd(DevProx..'Abs:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '࿈ 𖡻 العضو ↫ '..GetName..' \n࿈ 𖡻 قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions DevProx --
--     Source AlOmDa     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= DevProx then
floods = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAbs:get(DevProx.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAbs:setex(DevProx.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source AlOmDa     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(DevProx) then
DevAbs:set(DevProx..'Abs:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAbs:get(DevProx..'Abs:PinnedMsg'..msg.chat_id_)
if pin_id and DevAbs:get(DevProx..'Abs:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAbs:get(DevProx..'Abs:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAbs:del(DevProx..'Abs:viewget'..msg.sender_user_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevAbs:del(DevProx..'Abs:viewget'..msg.sender_user_id_)
end
end
--     Source AlOmDa     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAbs:get(DevProx..'Abs:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AlOmDa     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAbs:get(DevProx..'Abs:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AlOmDa     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAbs:get(DevProx..'Abs:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAbs:get(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_) then
text = DevAbs:get(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevAbs:get(DevProx.."Abs:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source AlOmDa     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAbs:get(DevProx..'Abs:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = DevProx,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(DevProx) then 
if DevAbs:sismember(DevProx..'Abs:Groups',msg.chat_id_) then
BotText = "مفعله في السابق\n࿈ 𖡻 ارسل ↫ الاوامر واستمتع بالمميزيات"
else 
BotText = "معطله يجب رفعي مشرف\n࿈ 𖡻 بعد ذلك يرجى ارسال امر ↫ تفعيل\n࿈ 𖡻 سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
local AbsText = (DevAbs:get(DevProx.."Abs:Text:BotWelcome") or "࿈ 𖡻 مرحبا انا بوت اسمي "..NameBot.."\n࿈ 𖡻 حالة المجموعه ↫ "..BotText.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉")
local AbsPhoto = (DevAbs:get(DevProx.."Abs:Photo:BotWelcome") or abbas.photos_[0].sizes_[1].photo_.persistent_id_)
if DevAbs:get(DevProx.."Abs:Photo:BotWelcome") or abbas.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AbsPhoto,AbsText)
else 
send(msg.chat_id_,msg.id_,AbsText)
end 
end   
end
end,nil)
end
if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAbs:get(DevProx.."Abs:Lock:Welcome"..msg.chat_id_) then
if DevAbs:get(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_) then
text = DevAbs:get(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'Dev_Prox'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source AlOmDa     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source AlOmDa     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(DevProx..'Abs:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source AlOmDa     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(DevProx..'Abs:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAbs:get(DevProx..'Abs:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAbs:get(DevProx..'Abs:Spam:Text'..msg.chat_id_))
end
if DevAbs:get(DevProx..'Abs:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source AlOmDa     --
if DevAbs:get(DevProx.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 تم الغاء حفظ الرابط")       
DevAbs:del(DevProx.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAbs:set(DevProx.."Abs:Groups:Links"..msg.chat_id_,Link)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ الرابط بنجاح', 1, 'md')
DevAbs:del(DevProx.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end
--     Source AlOmDa     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAbs:get('DevProxTEAM:'..DevProx.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('DevProxTEAM:'..DevProx..'id:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء الامر', 1, 'md')
DevAbs:del('DevProxTEAM:'..DevProx.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('DevProxTEAM:'..DevProx.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('DevProxTEAM:'..DevProx..'id:user'..msg.chat_id_)  
DevAbs:incrby(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Abs(msg.chat_id_, msg.id_,  1, "࿈ 𖡻 تم اضافة "..numadded..' رساله', 1, 'md')
DevAbs:del('DevProxTEAM:'..DevProx..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAbs:get('DevProxTEAM:'..DevProx.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('DevProxTEAM:'..DevProx..'ids:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء الامر', 1, 'md')
DevAbs:del('DevProxTEAM:'..DevProx.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('DevProxTEAM:'..DevProx.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('DevProxTEAM:'..DevProx..'ids:user'..msg.chat_id_)  
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "࿈ 𖡻 تم اضافة "..numadded..' نقطه', 1, 'md')
DevAbs:del('DevProxTEAM:'..DevProx..'ids:user'..msg.chat_id_)  
end
end
--     Source AlOmDa     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevAbs:get(DevProx.."Abs:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(DevProx.."Abs:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(DevProx.."Abs:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevAbs:get(DevProx.."Abs:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevAbs:get(DevProx.."Abs:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","࿈ 𖡻 ممنوع التكلم بالطائفيه هنا") 
end end
--     Source AlOmDa     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروباتميم' and ChCheck(msg) or text == 'جلب نسخه احتياطيهميم' and ChCheck(msg) then
local List = DevAbs:smembers(DevProx..'Abs:Groups') 
local BotName = (DevAbs:get(DevProx.."Abs:NameBot") or 'لوز')
local GetJson = '{"BotId": '..DevProx..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAbs:get(DevProx.."Abs:Groups:Links"..v)
Welcomes = DevAbs:get(DevProx..'Abs:Groups:Welcomes'..v) or ''
AbsConstructors = DevAbs:smembers(DevProx..'Abs:AbsConstructor:'..v)
Constructors = DevAbs:smembers(DevProx..'Abs:BasicConstructor:'..v)
BasicConstructors = DevAbs:smembers(DevProx..'Abs:Constructor:'..v)
Managers = DevAbs:smembers(DevProx..'Abs:Managers:'..v)
Admis = DevAbs:smembers(DevProx..'Abs:Admins:'..v)
Vips = DevAbs:smembers(DevProx..'Abs:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbsConstructors ~= 0 then
GetJson = GetJson..'"AbsConstructors":['
for k,v in pairs(AbsConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..DevProx..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..DevProx..'.json', '࿈ 𖡻 يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..DevProx..'.json')
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 or text == 'رفع النسخه الاحتياطيه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source AlOmDa     --
if DevAbs:get(DevProx.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abs( msg.chat_id_, msg.id_, 1,"࿈ 𖡻 يوجد فقط ( 6 ) اختيارات\n࿈ 𖡻 ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAbs:get(DevProx.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(DevProx.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *المحيبس باليد رقم* ↫ '..NUM..'\n࿈ 𖡻 *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:del(DevProx.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *المحيبس باليد رقم* ↫ '..GETNUM..'\n࿈ 𖡻 *للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAbs:get(DevProx..'DevAbs4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "࿈ 𖡻 تم الغاء الامر")
DevAbs:del(DevProx..'DevAbs4'..msg.sender_user_id_)
return false  end 
DevAbs:del(DevProx..'DevAbs4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '࿈ 𖡻 المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '࿈ 𖡻 عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '࿈ 𖡻 عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'࿈ 𖡻 البوت ادمن في القناة \n࿈ 𖡻 تم تفعيل الاشتراك الاجباري \n࿈ 𖡻 ايدي القناة ↫ '..data.id_..'\n࿈ 𖡻 معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevAbs:set(DevProx..'DevAbs2',data.id_)
DevAbs:set(DevProx..'DevAbs3','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'࿈ 𖡻 عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source AlOmDa     --
if DevAbs:get(DevProx.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevAbs:del(DevProx.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء الامر', 1, 'md')
return false 
end 
DevAbs:del(DevProx.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAbs:set(DevProx.."DevText", DevText)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ كليشة المطور", 1, "md")
end
if DevAbs:get(DevProx..'Abs:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevAbs:del(DevProx..'Abs:NameBot'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء الامر', 1, 'md')
return false 
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ اسم البوت ', 1, 'html')
DevAbs:del(DevProx..'Abs:NameBot'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:NameBot', text)
return false 
end
--     Source AlOmDa     --
if text == "الرابط" then
if not DevAbs:get(DevProx.."Abs:Lock:GpLinks"..msg.chat_id_) then 
if DevAbs:get(DevProx.."Abs:Groups:Links"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..DevAbs:get(DevProx.."Abs:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 جلب رابط المجموعه معطل', 1, 'md')
end
end
--     Source AlOmDa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevAbs:get(DevProx..'Abs:NameBot') or 'لوز')
local DevProxTEAM = {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
DevAbs2 = math.random(#DevProxTEAM) 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM[DevAbs2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevAbs:get(DevProx..'Abs:NameBot') or 'لوز') 
local DevProxTEAM = {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
DevAbs2 = math.random(#DevProxTEAM) 
Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM[DevAbs2] , 1, 'html') 
return false
end
if text and text == (DevAbs:get(DevProx..'Abs:NameBot') or 'لوز') then 
NameBot = (DevAbs:get(DevProx..'Abs:NameBot') or 'لوز')
local namebot = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
name = math.random(#namebot) 
Dev_Abs(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لم تربح اي نقطه\n࿈ 𖡻 ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 عدد النقاط التي ربحتها ↫ '..(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAbs:del(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevAbs:del(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف جميع نقاطك', 1, 'md') end
--     Source AlOmDa     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
DevProxTEAM = '࿈ 𖡻 اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ سمايلات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
DevProxTEAM = '࿈ 𖡻 اول واحد يرتبها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ ترتيب للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAbs:set(DevProx.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

࿈ 𖡻 اختر رقم لاستخراج المحيبس
࿈ 𖡻 الفائز يحصل على (5) نقاط
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbs:setex(DevProx.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
DevProxTEAM = '࿈ 𖡻 اول واحد يحلها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ حزوره للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum2'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
DevProxTEAM = '࿈ 𖡻 ما معنى هذا السمايل :؟ ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum2'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ المعاني للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum3'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
DevProxTEAM = '࿈ 𖡻 ما هو عكس كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum3'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ العكس للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum4'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
DevProxTEAM = '࿈ 𖡻 اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum4'..msg.chat_id_) and not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ المختلف للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum5'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
DevProxTEAM = '࿈ 𖡻 اكمل المثال التالي ↫ ['..name..']'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum5'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(DevProx..'Abs:GameNum5'..msg.chat_id_)
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ امثله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum6'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
DevProxTEAM = '࿈ 𖡻 اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum6'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(DevProx..'Abs:GameNum6'..msg.chat_id_)
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ رياضيات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum7'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
DevProxTEAM = '࿈ 𖡻 ما معنى كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum7'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(DevProx..'Abs:GameNum7'..msg.chat_id_)
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ انكليزيه للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end  
--     Source AlOmDa     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(DevProx..'Abs:GameNum8'..msg.chat_id_,name)
DevAbs:del(DevProx..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','࿈ 𖡻 ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','࿈ 𖡻 ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','࿈ 𖡻 كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','࿈ 𖡻 كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','࿈ 𖡻 كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','࿈ 𖡻 من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','࿈ 𖡻 من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','࿈ 𖡻 ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','࿈ 𖡻 ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','࿈ 𖡻 ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','࿈ 𖡻 ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','࿈ 𖡻 ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','࿈ 𖡻 ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','࿈ 𖡻 اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','࿈ 𖡻 في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','࿈ 𖡻 على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','࿈ 𖡻 ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','࿈ 𖡻 اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','࿈ 𖡻 تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','࿈ 𖡻 كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','࿈ 𖡻 ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','࿈ 𖡻 ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','࿈ 𖡻 ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','࿈ 𖡻 ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','࿈ 𖡻 ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','࿈ 𖡻 ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','࿈ 𖡻 ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','࿈ 𖡻 ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','࿈ 𖡻 من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
DevProxTEAM = name..'\n࿈ 𖡻 ارسل الجواب الصحيح فقط'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(DevProx..'Abs:GameNum8'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(DevProx..'Abs:GameNum8'..msg.chat_id_)
DevProxTEAM = '࿈ 𖡻 مبروك لقد ربحت في اللعبه \n࿈ 𖡻 ارسل ↫ الاسئله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md')
end
DevAbs:set(DevProx..'Abs:Games:Ids'..msg.chat_id_,true)
end  
--     Source AlOmDa     --
if DevAbs:get(DevProx.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Abs(msg.chat_id_, msg.id_, 1,"࿈ 𖡻 عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAbs:get(DevProx.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(DevProx.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *التخمين الصحيح هو* ↫ '..NUM..'\n࿈ 𖡻 *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:incrby(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAbs:get(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAbs:del(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(DevProx.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *التخمين الصحيح هو* ↫ '..GETNUM..'\n࿈ 𖡻 *للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAbs:get(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAbs:get(DevProx..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAbs:set(DevProx.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n࿈ 𖡻 ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAbs:setex(DevProx.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source AlOmDa     --
if text == 'روليت' then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs:del(DevProx.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:del(DevProx..'Abs:ListRolet'..msg.chat_id_)  
DevAbs:setex(DevProx.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAbs:get(DevProx.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "࿈ 𖡻 لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevAbs:set(DevProx.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '࿈ 𖡻 تم بدء تسجيل اللسته يرجى ارسال المعرفات \n࿈ 𖡻 الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevAbs:del(DevProx.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAbs:get(DevProx.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAbs:sismember(DevProx..'Abs:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'࿈ 𖡻 المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevAbs:sadd(DevProx..'Abs:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAbs:get(DevProx.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAbs:scard(DevProx..'Abs:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAbs:del(DevProx.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:setex(DevProx.."Abs:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "࿈ 𖡻 تم ادخال المعرف ↫ ["..text.."]\n࿈ 𖡻 وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "࿈ 𖡻 تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source AlOmDa     --
if text == 'كت تويت' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
local DevProxTEAM = {  "آخر مرة زرت مدينة الملاهي؟",  "آخر مرة أكلت أكلتك المفضّلة؟",  "الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل",  "آخر شيء ضاع منك؟","كلمة أخيرة لشاغل البال؟","طريقتك المعتادة في التخلّص من الطاقة السلبية؟","شهر من أشهر العام له ذكرى جميلة معك؟","كلمة غريبة من لهجتك ومعناها؟🤓","‏- شيء سمعته عالق في ذهنك هاليومين؟","متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟","‏- أبرز صفة حسنة في صديقك المقرب؟","هل تشعر أن هنالك مَن يُحبك؟","اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟","أجمل شيء حصل معك خلال هاليوم؟","صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔","كلمة لشخص غالي اشتقت إليه؟💕","آخر خبر سعيد، متى وصلك؟","أنا آسف على ....؟","أوصف نفسك بكلمة؟","صريح، مشتاق؟","‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟","‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭","‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤","‏- تخيّل شيء قد يحدث في المستقبل؟","‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚","شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟","| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.", }  
Dev_Abs(msg.chat_id_, msg.id_, 1, ''..DevProxTEAM[math.random(#DevProxTEAM)]..'' , 1, 'md')  
return false
end
end
--     Source AlOmDa     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Games'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1,[[
࿈ 𖡻 قائمة العاب المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 لعبة التخمين ↫ خمن
࿈ 𖡻 لعبة الامثله ↫ امثله
࿈ 𖡻 لعبة العكس ↫ العكس
࿈ 𖡻 لعبة الاسئله ↫ اسئله
࿈ 𖡻 لعبة الروليت ↫ روليت
࿈ 𖡻 لعبة الحزوره ↫ حزوره
࿈ 𖡻 لعبة الترتيب ↫ ترتيب
࿈ 𖡻 لعبة المعاني ↫ معاني
࿈ 𖡻 لعبة التويت ↫ كت تويت
࿈ 𖡻 لعبة المختلف ↫ المختلف
࿈ 𖡻 لعبة السمايلات ↫ سمايلات
࿈ 𖡻 لعبة المحيبس ↫ المحيبس
࿈ 𖡻 لعبة الرياضيات ↫ رياضيات
࿈ 𖡻 لعبة الانكليزيه ↫ انكليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]], 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source AlOmDa     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لم تربح اي نقطه\n࿈ 𖡻 ارسل ↫ الالعاب للعب', 1, 'md')
else
DevAbs0 = (DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAbs:incrby(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAbs0)
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 تم بيع '..(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n࿈ 𖡻 كل نقطه تساوي 50 رساله', 'md')
DevAbs:del(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source AlOmDa     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,abbas) 
DevAbs:del(DevProx..'Abs:AbsConstructor:'..msg.chat_id_)
local num = 0
local admins = abbas.members_  
for i=0 , #admins do   
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAbs:sadd(DevProx..'Abs:AbsConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لا يوجد ادمنيه ليتم رفعهم\n࿈ 𖡻 تم رفع منشئ المجموعه", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم رفع '..num..' من الادمنيه \n࿈ 𖡻 تم رفع منشئ المجموعه', 1, 'md')
end
end,nil) 
end
--     Source AlOmDa     --
if text == 'غادر' and SudoBot(msg) then
if DevAbs:get(DevProx.."Abs:Left:Bot"..DevProx) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "࿈ 𖡻 المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم مغادرة المجموعه \n࿈ 𖡻 تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, DevProx)
DevAbs:srem(DevProx.."Abs:Groups",msg.chat_id_)
end
--     Source AlOmDa     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source AlOmDa     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbs:get(DevProx..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 اسمك ↫ ❨ ['..result.first_name_..'] ❩\n࿈ 𖡻 معرفك ↫ ❨ ['..username..'] ❩\n࿈ 𖡻 ايديك ↫ ❨ `'..result.id_..'` ❩\n࿈ 𖡻 نقاطك ↫ ❨ '..user_nkt..' ❩\n࿈ 𖡻 رسائلك ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 جهاتك ↫ ❨ '..cont..' ❩\n࿈ 𖡻 تفاعلك ↫ '..formsgs(msguser)..'\n࿈ 𖡻 رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source AlOmDa     --
if text == "تعيين قناة الاشتراكميم" or text == "تغيير قناة الاشتراكميم" or text == "تعيين الاشتراك الاجباريميم" or text == "وضع قناة الاشتراكميم" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:setex(DevProx..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '࿈ 𖡻 ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباريميم" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
if DevAbs:get(DevProx..'DevAbs2') then
local DevCh = DevAbs:get(DevProx..'DevAbs3')
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاشتراك الاجباري مفعل \n࿈ 𖡻 على القناة ↫ ["..DevCh.."]")
else
DevAbs:setex(DevProx..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"࿈ 𖡻 لاتوجد قناة لتفعيل الاشتراك\n࿈ 𖡻 ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(DevProx..'DevAbs2') DevAbs:del(DevProx..'DevAbs3')
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراكميم" or text == "حذف قناه الاشتراكميم" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(DevProx..'DevAbs2') DevAbs:del(DevProx..'DevAbs3')
Dev_Abs(msg.chat_id_, msg.id_, 1,"࿈ 𖡻 تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراكميم' or text == 'قناة الاشتراكميم' or text == 'الاشتراك الاجباريميم' or text == 'قناة الاشتراك الاجباريميم' then
if DevAbs:get(DevProx..'DevAbs3') then
local DevCh = DevAbs:get(DevProx..'DevAbs3')
send(msg.chat_id_, msg.id_, "࿈ 𖡻 قناة الاشتراك ↫ ["..DevCh.."]")
else
send(msg.chat_id_, msg.id_, "࿈ 𖡻 لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source AlOmDa     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function DevProxTEAM(extra,result,success)
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevAbs:smembers(DevProx.."Abs:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAbs:smembers(DevProx.."Abs:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم اذاعة رسالتك بالتوجيه \n࿈ 𖡻 ‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n࿈ 𖡻 والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),DevProxTEAM)
end
end
--     Source AlOmDa     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevAbs:set(DevProx..'Abs:viewget'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source AlOmDa     --
if text == "السورس" or text == "سورس" then 
local text =  [[
Welcome To Source
࿈ 𖡻 AlomdA TEAM
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)

࿈ 𖡻 [Exp Source](https://t.me/Src_web)

┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Tws AlomdA](https://t.me/TwSLAlomdABot)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source AlOmDa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevAbs:get(DevProx.."Abs:Kick:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(DevProx..'yes'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(DevProx..'no'..msg.sender_user_id_..'', 'delno')
local Text = '࿈ 𖡻 هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source AlOmDa     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:set(DevProx.."Abs:Kick:Me"..msg.chat_id_, true)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:del(DevProx.."Abs:Kick:Me"..msg.chat_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source AlOmDa     --
if text == "نزلني" and ChCheck(msg) then
if DevAbs:get(DevProx.."Abs:Del:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(DevProx..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(DevProx..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = '࿈ 𖡻 هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source AlOmDa     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:set(DevProx.."Abs:Del:Me"..msg.chat_id_, true)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:del(DevProx.."Abs:Del:Me"..msg.chat_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source AlOmDa     --
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "࿈ 𖡻 وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(DevProx..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAbs:get(DevProx..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     Source AlOmDa     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
function TagAll(dp1,dp2)
local text = "࿈ 𖡻 "..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(DevProx..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevAbs:get(DevProx..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source AlOmDa     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevAbs:get(DevProx..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAbs:get(DevProx..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAbs:get(DevProx..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n࿈ 𖡻 مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n࿈ 𖡻 عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n࿈ 𖡻 نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source AlOmDa     --
if text == "معرفي" and ChCheck(msg) then
function get_username(extra,result,success)
text = '࿈ 𖡻 معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '࿈ 𖡻 اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source AlOmDa     --
if text == "اهمس" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or  text == "دزولي بوت الهمسه" then  Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 @HMSEBOT', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'࿈ 𖡻 اضغط للحصول على الرابط',nil,inline) return false end
if text == "بوت الحذف" or text == "اريد بوت الحذف" or text == "اريد بوت حذف" or text == "بوت حذف" or text == "بوت حذف حسابات" or text == "راح احذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'࿈ 𖡻 اضغط للحصول على البوت',nil,inline) return false end
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevAbs:get(DevProx..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevAbs:get(DevProx..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "ايديي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAbs:del(DevProx..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevAbs:del(DevProx..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source AlOmDa     --
if text == "المطور" then 
local DevCh1 = DevAbs:get(DevProx.."DevAbs3")
local DevText = DevAbs:get(DevProx.."DevText")
if DevCh1 then DevCh = '\n࿈ 𖡻 *Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Abs(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *Dev User* ↬ ['..DevUser..']\n࿈ 𖡻 *Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
--     Source AlOmDa     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function DevProxTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1422493638) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAbs:sismember(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local DevProxTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md') 
local DevProxTEAM = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProxTEAM[math.random(#DevProxTEAM)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,DevProxTEAM)
end
end
--     Source AlOmDa     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevProx) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1422493638) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAbs:sismember(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local DevProxTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md') 
local DevProxTEAM = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProxTEAM[math.random(#DevProxTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevProx) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local DevProxTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md') 
local DevProxTEAM = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProxTEAM[math.random(#DevProxTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevProx) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local DevProxTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md') 
local DevProxTEAM = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProxTEAM[math.random(#DevProxTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source AlOmDa     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function DevProxTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local DevProxTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,DevProxTEAM, 1, 'md') 
local DevProxTEAM = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..DevProxTEAM[math.random(#DevProxTEAM)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,DevProxTEAM)
end
end
end
--     Source AlOmDa     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(DevProx..'Abs:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(DevProx..'Abs:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(DevProx..'Abs:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(DevProx..'Abs:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(DevProx..'Abs:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(DevProx..'Abs:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 لم تتم ترقيته مسبقا")  
end
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(DevProx..'Abs:SecondSudo:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(DevProx..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(DevProx..'Abs:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(DevProx..'Abs:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(DevProx..'Abs:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(DevProx..'Abs:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(DevProx..'Abs:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(DevProx..'Abs:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(DevProx..'Abs:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..''..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 لم تتم ترقيته مسبقا")  
end 
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(DevProx..'Abs:SecondSudo:', result.id_)
DevAbs:srem(DevProx..'Abs:SudoBot:', result.id_)
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(DevProx..'Abs:SudoBot:', result.id_)
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(DevProx..'Abs:ManagerAll:', result.id_)
DevAbs:srem(DevProx..'Abs:AdminAll:', result.id_)
DevAbs:srem(DevProx..'Abs:VipAll:', result.id_)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source AlOmDa     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevAbs:sadd(DevProx..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين الثانويين")  
end
--     Source AlOmDa     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevAbs:srem(DevProx..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين الثانويين")  
end end
--     Source AlOmDa     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevAbs:sadd(DevProx..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المطورين")  
end
--     Source AlOmDa     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevAbs:srem(DevProx..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطورين")  
end end
--     Source AlOmDa     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAbs:sadd(DevProx..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء العامين")  
end
--     Source AlOmDa     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAbs:srem(DevProx..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء العامين")  
end end
--     Source AlOmDa     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAbs:sadd(DevProx..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه العامين")  
end
--     Source AlOmDa     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAbs:srem(DevProx..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه العامين")  
end end
--     Source AlOmDa     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAbs:sadd(DevProx..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين العام")  
end
--     Source AlOmDa     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAbs:srem(DevProx..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين العام")  
end end
--     Source AlOmDa     --
--  Set BasicConstructor  --
if ChatType == 'sp' or ChatType == 'gp'  then
if AbsConstructor(msg) then
if text ==('رفع منشئ اساسي') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAbs:sadd(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه منشئ اساسي")  
end
--     Source AlOmDa     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAbs:srem(DevProx..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AbsConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر لمنشئ المجموعه والمطورين فقط', 1, 'md')
end
--     Source AlOmDa     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAbs:sadd(DevProx..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المنشئين")  
end
--     Source AlOmDa     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAbs:srem(DevProx..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنشئين")  
end 
end
--     Source AlOmDa     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير (%d+)')
DevAbs:sadd(DevProx..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المدراء")  
end
--     Source AlOmDa     --
--       Rem Manager      --
if text ==('تنزيل مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAbs:srem(DevProx..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المدراء")  
end 
--     Source AlOmDa     --
--       Set Cleaner      --
if text ==('رفع منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(DevProx..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(DevProx..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and ChCheck(msg) then
local user = text:match('رفع منظف (%d+)')
DevAbs:sadd(DevProx..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المنظفين")  
end
--     Source AlOmDa     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevAbs:srem(DevProx..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المنظفين")  
end end
--     Source AlOmDa     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة الادمنيه")  
end
--     Source AlOmDa     --
--        Rem admin       --
if text ==('تنزيل ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة الادمنيه")  
end end
--     Source AlOmDa     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(DevProx..'Abs:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(DevProx..'Abs:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and DevAbs:get(DevProx.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(DevProx..'Abs:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفعه في قائمة المميزين")  
end
--     Source AlOmDa     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevAbs:srem(DevProx..'Abs:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تنزيله من قائمة المميزين")  
end end 
--     Source AlOmDa     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevProx)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه مشرف في المجموعه")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevProx)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من مشرفين المجموعه")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevProx)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local Abs = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevProx)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم اضافة ↫ "..Abs.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..Abs)
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
--     Source AlOmDa     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source AlOmDa     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     Source AlOmDa     --
if Constructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) or text == "تفعيل الطرد" and ChCheck(msg) then
DevAbs:del(DevProx.."Abs:Lock:KickBan"..msg.chat_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الحظر" and ChCheck(msg) or text == "تعطيل الطرد" and ChCheck(msg) then
DevAbs:set(DevProx.."Abs:Lock:KickBan"..msg.chat_id_,"true")
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تفعيل الكتم" and ChCheck(msg) or text == "تفعيل التقييد" and ChCheck(msg) then
DevAbs:del(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الكتم" and ChCheck(msg) or text == "تعطيل التقييد" and ChCheck(msg) then
DevAbs:set(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_,"true")
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) or text == "تفعيل الترقيه" and ChCheck(msg) then
DevAbs:del(DevProx.."Abs:Lock:ProSet"..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) or text == "تعطيل الترقيه" and ChCheck(msg) then
DevAbs:set(DevProx.."Abs:Lock:ProSet"..msg.chat_id_,"true")
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source AlOmDa     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم طرده من المجموعه")  
end,nil)
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source AlOmDa     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbs:sadd(DevProx..'Abs:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAbs:sadd(DevProx..'Abs:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"࿈ 𖡻 لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAbs:sadd(DevProx..'Abs:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم حظره من المجموعه")  
end,nil) 
end
end
--     Source AlOmDa     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم الغاء حظره من المجموعه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم الغاء حظره من المجموعه")  
end 
end 
--     Source AlOmDa     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(DevProx..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(DevProx..'Abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم كتمه من المجموعه")  
end
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","࿈ 𖡻 هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(DevProx..'Abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم كتمه من المجموعه")  
end
end
end
--     Source AlOmDa     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم الغاء كتمه من المجموعه")  
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","࿈ 𖡻 هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source AlOmDa     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم تقيده من المجموعه")  
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not Constructor(msg) and DevAbs:get(DevProx.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم تقيده من المجموعه")  
end
end
--     Source AlOmDa     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم الغاء تقيده من المجموعه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source AlOmDa     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbs:sadd(DevProx..'Abs:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAbs:sadd(DevProx..'Abs:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم حظره عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAbs:sadd(DevProx..'Abs:BanAll:', user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم حظره عام من المجموعات")  
end
--     Source AlOmDa     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevAbs:sadd(DevProx..'Abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
DevAbs:sadd(DevProx..'Abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم كتمه عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevAbs:sadd(DevProx..'Abs:MuteAll:', user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم كتمه عام من المجموعات")  
end
--     Source AlOmDa     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') then
function UnAllReply(extra, result, success)
DevAbs:srem(DevProx..'Abs:BanAll:', result.sender_user_id_)
DevAbs:srem(DevProx..'Abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAbs:srem(DevProx..'Abs:BanAll:', result.id_)
DevAbs:srem(DevProx..'Abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevAbs:srem(DevProx..'Abs:BanAll:', user)
DevAbs:srem(DevProx..'Abs:MuteAll:', user)
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source AlOmDa     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ⌁") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevAbs:setex(DevProx.."Abs:EditDev"..msg.sender_user_id_,300,true)
end
if DevAbs:get(DevProx.."Abs:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'࿈ 𖡻 تم الغاء امر تغير المطور الاساسي')
DevAbs:del(DevProx.."Abs:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAbs:del(DevProx.."Abs:EditDev"..msg.sender_user_id_)
DevAbs:set(DevProx.."Abs:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n࿈ 𖡻 المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '࿈ 𖡻 الايدي ↫ '..dp.id_..DevUser..'\n࿈ 𖡻 الاسم ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')\n࿈ 𖡻 تم حفظ المعلومات بنجاح\n࿈ 𖡻 استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"࿈ 𖡻 المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevAbs:del(DevProx.."Abs:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source AlOmDa     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAbs:sismember(DevProx..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفعه في قائمة المطايه") 
DevAbs:sadd(DevProx..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source AlOmDa     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevAbs:get(DevProx..'Abs:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAbs:sismember(DevProx..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 هو ليس مطي ليتم تنزيله") 
else
DevAbs:srem(DevProx..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source AlOmDa     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تقيده لمدة ↫ "..mutept.." د") 
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تقيده لمدة ↫ "..mutept.." س") 
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم تقيده لمدة ↫ "..mutept.." ي") 
DevAbs:sadd(DevProx..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source AlOmDa     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevAbs:set('DevProxTEAM:'..DevProx..'id:user'..msg.chat_id_,TXT)  
DevAbs:setex('DevProxTEAM:'..DevProx.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل عدد الرسائل الان \n࿈ 𖡻 ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevAbs:del(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAbs:incrby(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevAbs:set('DevProxTEAM:'..DevProx..'ids:user'..msg.chat_id_,TXT)  
DevAbs:setex('DevProxTEAM:'..DevProx.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل عدد النقاط الان \n࿈ 𖡻 ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevAbs:incrby(DevProx..'Abs:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevAbs:get(DevProx..'Abs:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevAbs:sadd(DevProx.."Abs:cleaner"..msg.chat_id_, msg.id_) else DevAbs:sadd(DevProx.."Abs:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevAbs:sismember(DevProx.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "࿈ 𖡻 التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAbs:set(DevProx..'Abs:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تثبيت الرساله بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source AlOmDa     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:VipMem:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المميزين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد مميزين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AlOmDa     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local abs =  'Abs:Admins:'..msg.chat_id_
local List = DevAbs:smembers(DevProx..abs)
text = "࿈ 𖡻 قائمة الادمنيه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *لا يوجد ادمنيه*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source AlOmDa     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Managers:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المدراء ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد مدراء*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Cleaner:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المنظفين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد منظفين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AlOmDa     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Constructor:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المنشئين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد منشئين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source AlOmDa     --
if AbsConstructor(msg) then
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:BasicConstructor:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد منشئين اساسيين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Dev_Prox")
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source AlOmDa     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Muted:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المكتومين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد مكتومين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Tkeed:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المقيدين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *لا يوجد مقيدين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:Ban:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المحظورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد محظورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevAbs:hkeys(DevProx..'Abs:Filters:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة المنع ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "࿈ 𖡻 لا توجد كلمات ممنوعه"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source AlOmDa     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevAbs:smembers(DevProx..'User:Donky:'..msg.chat_id_)
text = "࿈ 𖡻 قائمة مطاية المجموعه 😹💔 ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source AlOmDa     --
if text == "المطورين الثانويين" and SecondSudo(msg) or text == "الثانويين" and SecondSudo(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:SecondSudo:')
text = "࿈ 𖡻 قائمة المطورين الثانويين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌁" and ChCheck(msg) then 
local BanAll = DevAbs:smembers(DevProx..'Abs:BanAll:')
local MuteAll = DevAbs:smembers(DevProx..'Abs:MuteAll:')
if #BanAll ~= 0 then 
text = "࿈ 𖡻 قائمة المحظورين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(BanAll) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."࿈ 𖡻 قائمة المكتومين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "࿈ 𖡻 *لم يتم حظر او كتم اي عضو*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ⌁" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:SudoBot:')
text = "࿈ 𖡻 قائمة المطورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local sudouser = DevAbs:get(DevProx..'Abs:Sudos'..v) 
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..""..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *عذرا لم يتم رفع اي مطورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     --
if text == "المدراء العامين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:ManagerAll:')
text = "࿈ 𖡻 قائمة المدراء العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد مدراء عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source AlOmDa     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local List = DevAbs:smembers(DevProx..'Abs:VipAll:')
text = "࿈ 𖡻 قائمة المميزين العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "࿈ 𖡻 *لا يوجد مميزين عام*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source AlOmDa     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local abs =  'Abs:AdminAll:'
local List = DevAbs:smembers(DevProx..abs)
text = "࿈ 𖡻 قائمة الادمنيه العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(DevProx..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "࿈ 𖡻 *لا يوجد ادمنيه عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source AlOmDa     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
DevAbs:del(DevProx..'Abs:AbsConstructor:'..msg.chat_id_)
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Dev_Prox")
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم رفع منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAbs:sadd(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source AlOmDa     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbs:sadd(DevProx.."Abs:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbs:sadd(DevProx.."Abs:FilterPhoto"..msg.chat_id_,photo)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbs:sadd(DevProx.."Abs:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source AlOmDa     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbs:srem(DevProx.."Abs:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbs:srem(DevProx.."Abs:FilterPhoto"..msg.chat_id_,photo)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbs:srem(DevProx.."Abs:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source AlOmDa     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل تحويل الصيغ'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Thwel:Abs'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل تحويل الصيغ'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Thwel:Abs'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevAbs:get(DevProx..'Abs:Thwel:Abs'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','࿈ 𖡻 تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"࿈ 𖡻 تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source AlOmDa     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAbs:sismember(DevProx..'Abs:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(DevProx..'Abs:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(DevProx..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(DevProx..'Abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n࿈ 𖡻 القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(DevProx..'Abs:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n࿈ 𖡻 عدد الكروبات ↫ '..(DevAbs:get(DevProx..'Abs:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n࿈ 𖡻 لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '࿈ 𖡻 اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..result.sender_user_id_..')\n࿈ 𖡻 ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n࿈ 𖡻 رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n࿈ 𖡻 رسائله ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n࿈ 𖡻 نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 معرفه ↫ [@'..data.username_..']\n࿈ 𖡻 ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n࿈ 𖡻 رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n࿈ 𖡻 رسائله ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n࿈ 𖡻 نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '࿈ 𖡻 نوع الحساب ↫ ❨ '..ch..' ❩\n࿈ 𖡻 الايدي ↫ ❨ `'..res.id_..'` ❩\n࿈ 𖡻 المعرف ↫ ❨ [@'..username..'] ❩\n࿈ 𖡻 الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '࿈ 𖡻 نوع الحساب ↫ ❨ '..gr..' ❩\n࿈ 𖡻 الايدي ↫ ❨ '..res.id_..' ❩\n࿈ 𖡻 المعرف ↫ ❨ [@'..username..'] ❩\n࿈ 𖡻 الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAbs:sismember(DevProx..'Abs:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(DevProx..'Abs:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(DevProx..'Abs:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(DevProx..'Abs:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n࿈ 𖡻 القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(DevProx..'Abs:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n࿈ 𖡻 عدد الكروبات ↫ '..(DevAbs:get(DevProx..'Abs:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n࿈ 𖡻 لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 الحساب محذوف', 1, 'md')
return false  end
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 معرفه ↫ [@'..data.username_..']\n࿈ 𖡻 ايديه ↫ ❨ `'..res.id_..'` ❩\n࿈ 𖡻 رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..''..sudobot..'\n࿈ 𖡻 رسائله ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n࿈ 𖡻 نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAbs:sismember(DevProx..'Abs:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(DevProx..'Abs:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(DevProx..'Abs:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(DevProx..'Abs:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n࿈ 𖡻 القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(DevProx..'Abs:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n࿈ 𖡻 عدد الكروبات ↫ '..(DevAbs:get(DevProx..'Abs:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n࿈ 𖡻 لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '࿈ 𖡻 اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..iduser..')\n࿈ 𖡻 ايديه ↫ ❨ `'..iduser..'` ❩\n࿈ 𖡻 رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n࿈ 𖡻 رسائله ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n࿈ 𖡻 نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 معرفه ↫ [@'..data.username_..']\n࿈ 𖡻 ايديه ↫ ❨ `'..iduser..'` ❩\n࿈ 𖡻 رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n࿈ 𖡻 رسائله ↫ ❨ '..user_msgs..' ❩\n࿈ 𖡻 تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n࿈ 𖡻 نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source AlOmDa     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(DevProx..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(DevProx..'Abs:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbs:sismember(DevProx..'Abs:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbs:sismember(DevProx..'Abs:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الحظر العام ↫ '..banall..'\n࿈ 𖡻 الكتم العام ↫ '..muteall..'\n࿈ 𖡻 الحظر ↫ '..banned..'\n࿈ 𖡻 الكتم ↫ '..muted..'\n࿈ 𖡻 التقيد ↫ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAbs:sismember(DevProx..'Abs:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(DevProx..'Abs:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(DevProx..'Abs:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbs:sismember(DevProx..'Abs:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbs:sismember(DevProx..'Abs:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الحظر العام ↫ '..banall..'\n࿈ 𖡻 الكتم العام ↫ '..muteall..'\n࿈ 𖡻 الحظر ↫ '..banned..'\n࿈ 𖡻 الكتم ↫ '..muted..'\n࿈ 𖡻 التقيد ↫ '..tkeed..'', 1, 'md')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","࿈ 𖡻 تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","࿈ 𖡻 تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_,user) DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_,user) DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_,user)   
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(DevProx) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","࿈ 𖡻 تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_,result.id_) DevAbs:srem(DevProx..'Abs:Ban:'..msg.chat_id_,result.id_) DevAbs:srem(DevProx..'Abs:Muted:'..msg.chat_id_,result.id_)   
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source AlOmDa     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
࿈ 𖡻 𝐔𝐒𝐄𝐑 ↬ #username 
࿈ 𖡻 𝐈𝐃 ↬ #id
࿈ 𖡻 𝐒𝐓𝐀𝐒𝐓 ↬ #stast
࿈ 𖡻 𝐀𝐔𝐓𝐎 ↬ #cont 
࿈ 𖡻 𝐌𝐀𝐒𝐆 ↬ #msgs
࿈ 𖡻 𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevAbs:set(DevProx.."Abs:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم تغير كليشة الايدي")  
end
--     Source AlOmDa     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 رجائا اتبع التعليمات للتعيين \n࿈ 𖡻 لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("DevProx:New:id:"..DevProx..msg.sender_user_id_,'DevProxTEAM')
return "DevProxTEAM"
end
if text and DevAbs:get("DevProx:New:id:"..DevProx..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("DevProx:New:id:"..DevProx..msg.sender_user_id_)
return false
end
DevAbs:del("DevProx:New:id:"..DevProx..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ كليشة الايدي العامه', 1, 'md')
DevAbs:set(DevProx.."Abs:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف كليشة الايدي العامه")  
DevAbs:del(DevProx.."Abs:AllIds:Text")
end
end
--     Source AlOmDa     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 رجائا اتبع التعليمات للتعيين \n࿈ 𖡻 لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("DevProx:New:id:"..DevProx..msg.chat_id_..msg.sender_user_id_,'DevProxTEAM')
return "DevProxTEAM"
end
if text and Manager(msg) and DevAbs:get("DevProx:New:id:"..DevProx..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("DevProx:New:id:"..DevProx..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAbs:del("DevProx:New:id:"..DevProx..msg.chat_id_..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ الكليشه الجديده', 1, 'md')
DevAbs:set(DevProx.."Abs:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف كليشة الايدي")  
DevAbs:del(DevProx.."Abs:GpIds:Text"..msg.chat_id_)
end
end
--     Source AlOmDa     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function DevProxTEAM(extra,abbas,success)
if abbas.username_ then username = '@'..abbas.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, abbas, success) 
local msgsday = DevAbs:get(DevProx..'Abs:UsersMsgs'..DevProx..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAbs:get(DevProx..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAbs:get(DevProx..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAbs:get(DevProx..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAbs:get(DevProx..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if abbas.photos_[0] then
if not DevAbs:get(DevProx..'Abs:Lock:Id'..msg.chat_id_) then 
if not DevAbs:get(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_) then 
if DevAbs:get(DevProx.."Abs:AllIds:Text") then
newpicid = DevAbs:get(DevProx.."Abs:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "࿈ 𖡻 "..Description.."\n࿈ 𖡻 معرفك ↫ ❨ "..username.." ❩\n࿈ 𖡻 ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n࿈ 𖡻 رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n࿈ 𖡻 رسائلك ↫ ❨ "..user_msgs.." ❩\n࿈ 𖡻 سحكاتك ↫ ❨ "..edit_msg.." ❩\n࿈ 𖡻 تفاعلك ↫ "..formsgs(msguser).."\n࿈ 𖡻 نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get(DevProx.."Abs:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAbs:get(DevProx.."Abs:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAbs:get(DevProx.."Abs:AllIds:Text") then
newallid = DevAbs:get(DevProx.."Abs:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "࿈ 𖡻 معرفك ↫ ❨ "..username.." ❩\n࿈ 𖡻 ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n࿈ 𖡻 رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n࿈ 𖡻 رسائلك ↫ ❨ "..user_msgs.." ❩\n࿈ 𖡻 سحكاتك ↫ ❨ "..edit_msg.." ❩\n࿈ 𖡻 تفاعلك ↫ "..formsgs(msguser).."\n࿈ 𖡻 نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevAbs:get(DevProx.."Abs:GpIds:Text"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAbs:get(DevProx.."Abs:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عذرا الايدي معطل ', 1, 'md')
end
else
if DevAbs:get(DevProx.."Abs:AllIds:Text") then
notpicid = DevAbs:get(DevProx.."Abs:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "࿈ 𖡻 لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 معرفك ↫ ❨ "..username.." ❩\n࿈ 𖡻 ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n࿈ 𖡻 رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n࿈ 𖡻 رسائلك ↫ ❨ "..user_msgs.." ❩\n࿈ 𖡻 سحكاتك ↫ ❨ "..edit_msg.." ❩\n࿈ 𖡻 تفاعلك ↫ "..formsgs(msguser).."\n࿈ 𖡻 نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get(DevProx..'Abs:Lock:Id'..msg.chat_id_) then
if not DevAbs:get(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 معرفك ↫ ❨ "..username.." ❩\n࿈ 𖡻 ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n࿈ 𖡻 رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n࿈ 𖡻 رسائلك ↫ ❨ "..user_msgs.." ❩\n࿈ 𖡻 سحكاتك ↫ ❨ "..edit_msg.." ❩\n࿈ 𖡻 رسائلك ↫ ❨ "..user_msgs.." ❩\n࿈ 𖡻 تفاعلك ↫ "..formsgs(msguser).."\n࿈ 𖡻 نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, DevProxTEAM)
end
end 
--     Source AlOmDa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التعديل")  
DevAbs:set(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل تعديل الميديا")  
DevAbs:set(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevAbs:get(DevProx..'Abs:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الفارسيه")  
DevAbs:set(DevProx..'Abs:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevAbs:get(DevProx..'Abs:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الفشار")  
DevAbs:del(DevProx..'Abs:Lock:Fshar'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevAbs:get(DevProx..'Abs:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الطائفيه")  
DevAbs:del(DevProx..'Abs:Lock:Taf'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevAbs:get(DevProx..'Abs:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الكفر")  
DevAbs:del(DevProx..'Abs:Lock:Kfr'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevAbs:get(DevProx..'Abs:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الفارسيه بالطرد")  
DevAbs:set(DevProx..'Abs:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل البوتات بالحذف")  
DevAbs:set(DevProx.."Abs:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل البوتات بالطرد")  
DevAbs:set(DevProx.."Abs:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل البوتات بالتقيد")  
DevAbs:set(DevProx.."Abs:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevAbs:get(DevProx..'Abs:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAbs:set(DevProx.."Abs:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التثبيت")  
DevAbs:set(DevProx..'Abs:Lock:Pin'..msg.chat_id_,true)
DevAbs:sadd(DevProx.."Abs:Lock:Pinpin",msg.chat_id_) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source AlOmDa     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevAbs:get(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Lock:Id'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الايدي بالتاكيد مفعل ', 1, 'md')
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevAbs:get(DevProx..'Abs:Lock:Id'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الايدي بالتاكيد معطل ', 1, 'md')
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source AlOmDa     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbs:setex(DevProx.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAbs:get(DevProx.."Abs:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAbs:set(DevProx.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbs:setex(DevProx.."Abs:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."Abs:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."Abs:Lock:Welcome"..msg.chat_id_)
end
if DevAbs:get(DevProx..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevAbs:del(DevProx..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(DevProx..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي الترحيب الان\n࿈ 𖡻 تستطيع اضافة مايلي ↫ ⤈\n࿈ 𖡻 دالة عرض الاسم ↫ firstname\n࿈ 𖡻 دالة عرض المعرف ↫ username', 1, 'md')
DevAbs:set(DevProx..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف الترحيب")  
DevAbs:del(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local wel = DevAbs:get(DevProx..'Abs:Groups:Welcomes'..msg.chat_id_)
if wel then
Dev_Abs(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لم يتم وضع الترحيب \n࿈ 𖡻 ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source AlOmDa     --
if DevAbs:get(DevProx..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء حفظ الوصف", 1, 'md')
DevAbs:del(DevProx..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(DevProx..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevAbs:set(DevProx..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي الوصف الان', 1, 'md')
end
--     Source AlOmDa     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل لي الكلمه الان", 1, 'md') 
DevAbs:set(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAbs:get(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر المنع', 1, 'md')
DevAbs:del(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم منع الكلمه ↫ "..text, 1, 'html')
DevAbs:del(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAbs:hset(DevProx..'Abs:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل لي الكلمه الان", 1, 'md') 
DevAbs:set(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAbs:get(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر الغاء المنع', 1, 'md')
DevAbs:del(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAbs:hget(DevProx..'Abs:Filters:'..msg.chat_id_, text) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevAbs:del(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAbs:hdel(DevProx..'Abs:Filters:'..msg.chat_id_, text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevAbs:del(DevProx.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source AlOmDa     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫ الاحصائيات ⌁" then
local gps = DevAbs:scard(DevProx.."Abs:Groups") local users = DevAbs:scard(DevProx.."Abs:Users") 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 احصائيات البوت ↫ ⤈\n࿈ 𖡻 عدد المشتركين ↫ ❨ '..users..' ❩\n࿈ 𖡻 عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ⌁" then
local users = DevAbs:scard(DevProx.."Abs:Users")
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
end
--     Source AlOmDa     --
if text and text == 'المجموعات' and ChCheck(msg) or text and text == '↫ المجموعات ⌁' then
if not SudoBot(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطورين فقط ', 1, 'md')
else
local List = DevAbs:smembers(DevProx.."Abs:Groups")
local t = '࿈ 𖡻 مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(List) do
t = t..k.."~ : `"..v.."`\n" 
end
if #List == 0 then
t = '࿈ 𖡻 لا يوجد مجموعات مفعله'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source AlOmDa     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevAbs:get(DevProx..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevAbs:setex(DevProx..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAbs:smembers(DevProx.."Abs:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAbs:srem(DevProx.."Abs:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 *لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عدد المشتركين الان ↫ { '..#pv..' }\n࿈ 𖡻 تم حذف ↫ { '..sendok..' } من المشتركين\n࿈ 𖡻 العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source AlOmDa     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAbs:smembers(DevProx.."Abs:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAbs:srem(DevProx.."Abs:Groups",group[i]) 
changeChatMemberStatus(group[i], DevProx, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbs:srem(DevProx.."Abs:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbs:srem(DevProx.."Abs:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAbs:srem(DevProx.."Abs:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 *لاتوجد مجموعات وهميه*', 1, 'md')   
else
local DevProxgp2 = (w + q)
local DevProxgp3 = #group - DevProxgp2
if q == 0 then
DevProxgp2 = ''
else
DevProxgp2 = '\n࿈ 𖡻 تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
DevProxgp1 = ''
else
DevProxgp1 = '\n࿈ 𖡻 تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'࿈ 𖡻 عدد الكروبات الان ↫ { '..#group..' }'..DevProxgp1..''..DevProxgp2..'\n࿈ 𖡻 العدد الحقيقي الان  ↫ ( '..DevProxgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source AlOmDa     --
if text == "تفعيل امسح" and Constructor(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if DevAbs:get(DevProx..'Abs:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevAbs:scard(DevProx.."Abs:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 عدد الميديا ↫ "..M, 1, 'md') 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevAbs:smembers(DevProx.."Abs:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
if Del ~= 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف "..Del.." من الميديا", 1, 'md') 
DevAbs:del(DevProx.."Abs:cleaner"..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Abs_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abs_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abs_Del},function(arg,data)
new = 0
Abs_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Abs_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Abs_Del2)
end,nil)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source AlOmDa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح التعديل")  
DevAbs:del(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح تعديل الميديا")  
DevAbs:del(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه" then
if DevAbs:get(DevProx..'Abs:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الفارسيه")  
DevAbs:del(DevProx..'Abs:Lock:Farsi'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevAbs:get(DevProx..'Abs:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الفشار")  
DevAbs:set(DevProx..'Abs:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevAbs:get(DevProx..'Abs:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الطائفيه")  
DevAbs:set(DevProx..'Abs:Lock:Taf'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevAbs:get(DevProx..'Abs:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الكفر")  
DevAbs:set(DevProx..'Abs:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevAbs:get(DevProx..'Abs:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الفارسيه بالطرد")  
DevAbs:del(DevProx..'Abs:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح البوتات")  
DevAbs:del(DevProx.."Abs:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "التكرار" then 
DevAbs:hdel(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevAbs:get(DevProx..'Abs:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح التثبيت")  
DevAbs:del(DevProx..'Abs:Lock:Pin'..msg.chat_id_)
DevAbs:srem(DevProx.."Abs:Lock:Pinpin",msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevAbs:get(DevProx..'Abs:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الدردشه")  
DevAbs:set(DevProx..'Abs:Lock:Text'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevAbs:get(DevProx..'Abs:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الاونلاين")  
DevAbs:set(DevProx..'Abs:Lock:Inline'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevAbs:get(DevProx..'Abs:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الصور")  
DevAbs:set(DevProx..'Abs:Lock:Photo'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevAbs:get(DevProx..'Abs:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الكلايش")  
DevAbs:set(DevProx..'Abs:Lock:Spam'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevAbs:get(DevProx..'Abs:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الدخول")  
DevAbs:set(DevProx..'Abs:Lock:Join'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevAbs:get(DevProx..'Abs:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الفيديو")  
DevAbs:set(DevProx..'Abs:Lock:Videos'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevAbs:get(DevProx..'Abs:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل المتحركه")  
DevAbs:set(DevProx..'Abs:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevAbs:get(DevProx..'Abs:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الاغاني")  
DevAbs:set(DevProx..'Abs:Lock:Music'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevAbs:get(DevProx..'Abs:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الصوت")  
DevAbs:set(DevProx..'Abs:Lock:Voice'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الروابط")  
DevAbs:set(DevProx..'Abs:Lock:Links'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevAbs:get(DevProx..'Abs:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل المواقع")  
DevAbs:set(DevProx..'Abs:Lock:Location'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل المعرفات")  
DevAbs:set(DevProx..'Abs:Lock:Tags'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevAbs:get(DevProx..'Abs:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الملفات")  
DevAbs:set(DevProx..'Abs:Lock:Document'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الهاشتاك")  
DevAbs:set(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevAbs:get(DevProx..'Abs:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الجهات")  
DevAbs:set(DevProx..'Abs:Lock:Contact'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '️࿈ 𖡻 الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الشبكات")  
DevAbs:set(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل العربيه")  
DevAbs:set(DevProx..'Abs:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الانكليزيه")  
DevAbs:set(DevProx..'Abs:Lock:English'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevAbs:get(DevProx..'Abs:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الملصقات")  
DevAbs:set(DevProx..'Abs:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevAbs:get(DevProx..'Abs:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الماركداون")  
DevAbs:set(DevProx..'Abs:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل الاشعارات")  
DevAbs:set(DevProx..'Abs:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التوجيه")  
DevAbs:set(DevProx..'Abs:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevAbs:get(DevProx..'Abs:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الدردشه")  
DevAbs:del(DevProx..'Abs:Lock:Text'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevAbs:get(DevProx..'Abs:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الصور")  
DevAbs:del(DevProx..'Abs:Lock:Photo'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevAbs:get(DevProx..'Abs:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الكلايش")  
DevAbs:del(DevProx..'Abs:Lock:Spam'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevAbs:get(DevProx..'Abs:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الدخول")  
DevAbs:del(DevProx..'Abs:Lock:Join'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevAbs:get(DevProx..'Abs:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الفيديو")  
DevAbs:del(DevProx..'Abs:Lock:Videos'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevAbs:get(DevProx..'Abs:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الملفات")  
DevAbs:del(DevProx..'Abs:Lock:Document'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevAbs:get(DevProx..'Abs:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الاونلاين")  
DevAbs:del(DevProx..'Abs:Lock:Inline'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevAbs:get(DevProx..'Abs:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الماركداون")  
DevAbs:del(DevProx..'Abs:Lock:Markdown'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevAbs:get(DevProx..'Abs:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح المتحركه")  
DevAbs:del(DevProx..'Abs:Lock:Gifs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevAbs:get(DevProx..'Abs:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الاغاني")  
DevAbs:del(DevProx..'Abs:Lock:Music'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevAbs:get(DevProx..'Abs:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الصوت")  
DevAbs:del(DevProx..'Abs:Lock:Voice'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الروابط")  
DevAbs:del(DevProx..'Abs:Lock:Links'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevAbs:get(DevProx..'Abs:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح المواقع")  
DevAbs:del(DevProx..'Abs:Lock:Location'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح المعرفات")  
DevAbs:del(DevProx..'Abs:Lock:Tags'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الهاشتاك")  
DevAbs:del(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevAbs:get(DevProx..'Abs:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الجهات")  
DevAbs:del(DevProx..'Abs:Lock:Contact'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الشبكات")  
DevAbs:del(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح العربيه")  
DevAbs:del(DevProx..'Abs:Lock:Arabic'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الانكليزيه")  
DevAbs:del(DevProx..'Abs:Lock:English'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الاشعارات")  
DevAbs:del(DevProx..'Abs:Lock:TagServr'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevAbs:get(DevProx..'Abs:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح الملصقات")  
DevAbs:del(DevProx..'Abs:Lock:Stickers'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح التوجيه")  
DevAbs:del(DevProx..'Abs:Lock:Forwards'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source AlOmDa     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمنشئين فقط', 1, 'md')
else
DevAbs:set(DevProx.."Abs:Lock:Bots"..msg.chat_id_,"del") DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbs:set(DevProx..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمنشئين فقط', 1, 'md')
else
DevAbs:hdel(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAbs:del(DevProx..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح التفليش")  
end
end
--     Source AlOmDa     --
if text and text:match("^قفل الكل$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمنشئين فقط', 1, 'md')
else
DevAbs:del(DevProx..'Abs:Lock:Fshar'..msg.chat_id_) DevAbs:del(DevProx..'Abs:Lock:Taf'..msg.chat_id_) DevAbs:del(DevProx..'Abs:Lock:Kfr'..msg.chat_id_) 
DevAbs:set(DevProx.."Abs:Lock:Bots"..msg.chat_id_,"del") DevAbs:hset(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abs:Lock:EditMsgs','Abs:Lock:Farsi','Abs:Lock:TagServr','Abs:Lock:Inline','Abs:Lock:Photo','Abs:Lock:Spam','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:Music','Abs:Lock:Voice','Abs:Lock:Links','Abs:Lock:Location','Abs:Lock:Tags','Abs:Lock:Stickers','Abs:Lock:Markdown','Abs:Lock:Forwards','Abs:Lock:Document','Abs:Lock:Contact','Abs:Lock:Hashtak','Abs:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAbs:set(DevProx..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمنشئين فقط', 1, 'md')
else
DevAbs:set(DevProx..'Abs:Lock:Fshar'..msg.chat_id_,true) DevAbs:set(DevProx..'Abs:Lock:Taf'..msg.chat_id_,true) DevAbs:set(DevProx..'Abs:Lock:Kfr'..msg.chat_id_,true) DevAbs:hdel(DevProx.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abs:Lock:EditMsgs','Abs:Lock:Text','Abs:Lock:Arabic','Abs:Lock:English','Abs:Lock:Join','Abs:Lock:Bots','Abs:Lock:Farsi','Abs:Lock:FarsiBan','Abs:Lock:TagServr','Abs:Lock:Inline','Abs:Lock:Photo','Abs:Lock:Spam','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:Music','Abs:Lock:Voice','Abs:Lock:Links','Abs:Lock:Location','Abs:Lock:Tags','Abs:Lock:Stickers','Abs:Lock:Markdown','Abs:Lock:Forwards','Abs:Lock:Document','Abs:Lock:Contact','Abs:Lock:Hashtak','Abs:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAbs:del(DevProx..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم فتح جميع الاوامر")  
end
end
--     Source AlOmDa     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevAbs:set(DevProx..'Abs:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source AlOmDa     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevProx)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 صلاحيات البوت هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 حذف الرسائل ↫ '..DEL..'\n࿈ 𖡻 دعوة المستخدمين ↫ '..INV..'\n࿈ 𖡻 حظر المستخدمين ↫ '..BAN..'\n࿈ 𖡻 تثبيت الرسائل ↫ '..PIN..'\n࿈ 𖡻 تغيير المعلومات ↫ '..EDT..'\n࿈ 𖡻 اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevAbs:set(DevProx.."Abs:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevAbs:set(DevProx.."Abs:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevAbs:set(DevProx.."Abs:Constructor:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevAbs:set(DevProx.."Abs:Managers:Rd"..msg.chat_id_,Text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevAbs:set(DevProx.."Abs:Admins:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevAbs:set(DevProx.."Abs:VipMem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevAbs:set(DevProx.."Abs:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevAbs:set(DevProx.."Abs:mem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف جميع ردود الرتب", 1, 'md')
DevAbs:del(DevProx.."Abs:mem:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:Cleaner:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:VipMem:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:Admins:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:Managers:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:Constructor:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:BasicConstructor:Rd"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source AlOmDa     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '࿈ 𖡻 *قائمة البوتات* ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 *عدد البوتات هنا* ↫ '..n..'\n'
local f = '࿈ 𖡻 *عدد البوتات المرفوعه* ↫ '..t..'\n࿈ 𖡻 *ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_Abs(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(DevProx) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *لاتوجد بوتات هنا*", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 *عدد البوتات هنا* ↫ "..c.."\n࿈ 𖡻 *عدد البوتات المرفوعه* ↫ "..x.."\n࿈ 𖡻 *تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source AlOmDa     --
end
--     Source AlOmDa     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevAbs:del(DevProx..'Abs:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevAbs:del(DevProx..'Abs:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevAbs:del(DevProx..'Abs:BanAll:')
DevAbs:del(DevProx..'Abs:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف الادمنيه العامين")  
DevAbs:del(DevProx..'Abs:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المميزين عام")  
DevAbs:del(DevProx..'Abs:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المدراء العامين")  
DevAbs:del(DevProx..'Abs:ManagerAll:')
end
end
if AbsConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المنشئين الاساسيين")  
DevAbs:del(DevProx..'Abs:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المنشئين")  
DevAbs:del(DevProx..'Abs:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المدراء")  
DevAbs:del(DevProx..'Abs:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المنظفين")  
DevAbs:del(DevProx..'Abs:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف الادمنيه")  
DevAbs:del(DevProx..'Abs:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المطايه")  
DevAbs:del(DevProx..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف رابط المجموعه")  
DevAbs:del(DevProx.."Abs:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المميزين")  
DevAbs:del(DevProx..'Abs:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevAbs:del(DevProx..'Abs:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevAbs:smembers(DevProx..'Abs:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAbs:srem(DevProx..'Abs:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المقيدين")  
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قائمة المنع")  
DevAbs:del(DevProx..'Abs:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قوائم المنع")  
DevAbs:del(DevProx..'Abs:Filters:'..msg.chat_id_)
DevAbs:del(DevProx.."Abs:FilterAnimation"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:FilterPhoto"..msg.chat_id_)
DevAbs:del(DevProx.."Abs:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevAbs:del(DevProx.."Abs:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevAbs:del(DevProx.."Abs:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevAbs:del(DevProx.."Abs:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف قائمة منع الملصقات")  
end
end
end
--     Source AlOmDa     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمنشئ الاساسي فقط', 1, 'md')
else
DevAbs:del(DevProx..'Abs:Ban:'..msg.chat_id_) DevAbs:del(DevProx..'Abs:Admins:'..msg.chat_id_) DevAbs:del(DevProx..'User:Donky:'..msg.chat_id_) DevAbs:del(DevProx..'Abs:VipMem:'..msg.chat_id_) DevAbs:del(DevProx..'Abs:Filters:'..msg.chat_id_) DevAbs:del(DevProx..'Abs:Muted:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source AlOmDa     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not AbsConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لمنشئ المجموعه فقط', 1, 'md')
else
local basicconstructor = DevAbs:smembers(DevProx..'Abs:BasicConstructor:'..msg.chat_id_)
local constructor = DevAbs:smembers(DevProx..'Abs:Constructor:'..msg.chat_id_)
local Managers = DevAbs:smembers(DevProx..'Abs:Managers:'..msg.chat_id_)
local admins = DevAbs:smembers(DevProx..'Abs:Admins:'..msg.chat_id_)
local vipmem = DevAbs:smembers(DevProx..'Abs:VipMem:'..msg.chat_id_)
local donky = DevAbs:smembers(DevProx..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAbs:del(DevProx..'Abs:BasicConstructor:'..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Constructor:'..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Managers:'..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Admins:'..msg.chat_id_)
DevAbs:del(DevProx..'Abs:VipMem:'..msg.chat_id_)
DevAbs:del(DevProx..'User:Donky:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source AlOmDa     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevAbs:get(DevProx..'Abs:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAbs:get(DevProx..'Abs:Spam:Text'..msg.chat_id_)
end
--     Source AlOmDa     --
if DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source AlOmDa     --
if DevAbs:get(DevProx.."Abs:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevAbs:get(DevProx.."Abs:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevAbs:get(DevProx.."Abs:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source AlOmDa     --
if DevAbs:get(DevProx..'Abs:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevAbs:get(DevProx..'Abs:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevAbs:get(DevProx.."Abs:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevAbs:get(DevProx..'Abs:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevAbs:get(DevProx..'Abs:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevAbs:get(DevProx..'Abs:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevAbs:get(DevProx..'Abs:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevAbs:hget(DevProx.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source AlOmDa     --
local TXTE = "࿈ 𖡻 اعدادات المجموعه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
.."࿈ 𖡻 الروابط ↫ "..mute_links.."\n"
.."࿈ 𖡻 المعرف ↫ "..lock_tag.."\n"
.."࿈ 𖡻 البوتات ↫ "..lock_bots.."\n"
.."࿈ 𖡻 المتحركه ↫ "..mute_gifs.."\n"
.."࿈ 𖡻 الملصقات ↫ "..lock_sticker.."\n"
.."࿈ 𖡻 الملفات ↫ "..lock_file.."\n"
.."࿈ 𖡻 الصور ↫ "..mute_photo.."\n"
.."࿈ 𖡻 الفيديو ↫ "..mute_video.."\n"
.."࿈ 𖡻 الاونلاين ↫ "..mute_in.."\n"
.."࿈ 𖡻 الدردشه ↫ "..mute_text.."\n"
.."࿈ 𖡻 التوجيه ↫ "..lock_forward.."\n"
.."࿈ 𖡻 الاغاني ↫ "..mute_music.."\n"
.."࿈ 𖡻 الصوت ↫ "..mute_voice.."\n"
.."࿈ 𖡻 الجهات ↫ "..lock_contact.."\n"
.."࿈ 𖡻 الماركداون ↫ "..markdown.."\n"
.."࿈ 𖡻 الهاشتاك ↫ "..lock_htag.."\n"
.."࿈ 𖡻 التعديل ↫ "..mute_edit.."\n"
.."࿈ 𖡻 التثبيت ↫ "..lock_pin.."\n"
.."࿈ 𖡻 الاشعارات ↫ "..lock_tgservice.."\n"
.."࿈ 𖡻 الكلايش ↫ "..lock_spam.."\n"
.."࿈ 𖡻 الدخول ↫ "..lock_Join.."\n"
.."࿈ 𖡻 الشبكات ↫ "..lock_wp.."\n"
.."࿈ 𖡻 المواقع ↫ "..lock_location.."\n"
.."࿈ 𖡻 الفشار ↫ "..lock_fshar.."\n"
.."࿈ 𖡻 الكفر ↫ "..lock_kaf.."\n"
.."࿈ 𖡻 الطائفيه ↫ "..lock_taf.."\n"
.."࿈ 𖡻 العربيه ↫ "..lock_arabic.."\n"
.."࿈ 𖡻 الانكليزيه ↫ "..lock_english.."\n"
.."࿈ 𖡻 الفارسيه ↫ "..lock_farsi.."\n"
.."࿈ 𖡻 التكرار ↫ "..flood.."\n"
.."࿈ 𖡻 عدد التكرار ↫ "..Flood_Num.."\n"
.."࿈ 𖡻 عدد السبام ↫ "..spam_c.."\n"
.."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 [Source Channel](https://t.me/Src_Web)\n"
Dev_Abs(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source AlOmDa     --
if text and text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Abs(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source AlOmDa     --
if DevAbs:get(DevProx..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevAbs:del(DevProx..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(DevProx..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:rules'..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي القوانين الان', 1, 'md')
DevAbs:set(DevProx..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevAbs:get(DevProx..'Abs:rules'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source AlOmDa     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Zrf:Abs'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Zrf:Abs'..msg.chat_id_,true)  
end
if DevAbs:get(DevProx..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر الزخرفه', 1, 'md')
DevAbs:del(DevProx..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "࿈ 𖡻 قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAbs:del(DevProx..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not DevAbs:get(DevProx..'Abs:Zrf:Abs'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevAbs:setex(DevProx.."Zrf:Abs"..msg.chat_id_..""..msg.sender_user_id_,300,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevAbs:get(DevProx..'Abs:Zrf:Abs'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and ChCheck(msg) or text and text:match("^زخرف (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "࿈ 𖡻 قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source AlOmDa     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Brg:Abs'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Brg:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(DevProx..'Abs:Brg:Abs'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and ChCheck(msg) or text and text:match("^برجي (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AlOmDa     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Nsba:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) then
if text == "نسبه الحب" and ChCheck(msg) or text == "نسبة الحب" and ChCheck(msg) then
DevAbs:set(DevProx..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevAbs:get(DevProx..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر نسبة الحب ', 1, 'md')
DevAbs:del(DevProx..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 نسبة الحب بين '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(DevProx..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) then
if text == "نسبه الكره" and ChCheck(msg) or text == "نسبة الكره" and ChCheck(msg) then
DevAbs:set(DevProx..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and DevAbs:get(DevProx..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر نسبة الكره ', 1, 'md')
DevAbs:del(DevProx..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 نسبة الكره بين '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(DevProx..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and ChCheck(msg) then
DevAbs:set(DevProx..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and DevAbs:get(DevProx..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر نسبة الرجوله ', 1, 'md')
DevAbs:del(DevProx..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 نسبة رجولة '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(DevProx..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and ChCheck(msg) then
DevAbs:set(DevProx..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and DevAbs:get(DevProx..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر نسبة الانوثه ', 1, 'md')
DevAbs:del(DevProx..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 نسبة انوثة '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(DevProx..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(DevProx..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء") and ChCheck(msg) then
DevAbs:set(DevProx..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and DevAbs:get(DevProx..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم الغاء امر نسبة الغباء ', 1, 'md')
DevAbs:del(DevProx..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 نسبة غباء '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(DevProx..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source AlOmDa     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Age:Abs'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Age:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(DevProx..'Abs:Age:Abs'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and ChCheck(msg) or text and text:match("^عمري (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AlOmDa     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Mean:Abs'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Mean:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(DevProx..'Abs:Mean:Abs'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and ChCheck(msg) or text and text:match("^معنى اسم (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source AlOmDa     --
if text == "غنيلي" and ChCheck(msg) then
data,res = https.request('https://apiabs.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='࿈ 𖡻 تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ DevProx TeAM .',url="t.me/Dev_Prox"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     Source AlOmDa     --
if Admin(msg) then
if DevAbs:get(DevProx..'Abs:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevAbs:get(DevProx..'Abs:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الروابط ↫ "..mute_links.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevAbs:get(DevProx..'Abs:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 المعرف ↫ "..lock_tag.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevAbs:get(DevProx..'Abs:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 المتحركه ↫ "..mute_gifs.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الملصقات" then if DevAbs:get(DevProx..'Abs:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الملصقات ↫ "..lock_sticker.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الصور" then if DevAbs:get(DevProx..'Abs:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الصور ↫ "..mute_photo.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevAbs:get(DevProx..'Abs:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الفيديو ↫ "..mute_video.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الاونلاين" then if DevAbs:get(DevProx..'Abs:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 الاونلاين ↫ "..mute_in.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الدردشه" then if DevAbs:get(DevProx..'Abs:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الدردشه ↫ "..mute_text.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevAbs:get(DevProx..'Abs:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 التوجيه ↫ "..lock_forward.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الاغاني" then if DevAbs:get(DevProx..'Abs:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الاغاني ↫ "..mute_music.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevAbs:get(DevProx..'Abs:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 الصوت ↫ "..mute_voice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevAbs:get(DevProx..'Abs:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الجهات ↫ "..lock_contact.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الماركداون" then if DevAbs:get(DevProx..'Abs:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 الماركداون ↫ "..markdown.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الهاشتاك" then if DevAbs:get(DevProx..'Abs:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 الهاشتاك ↫ "..lock_htag.."\n"Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "التعديل" then if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 التعديل ↫ "..mute_edit.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "التثبيت" then if DevAbs:get(DevProx..'Abs:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 التثبيت ↫ "..lock_pin.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الاشعارات" then if DevAbs:get(DevProx..'Abs:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الاشعارات ↫ "..lock_tgservice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الكلايش" then if DevAbs:get(DevProx..'Abs:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الكلايش ↫ "..lock_spam.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الدخول" then if DevAbs:get(DevProx..'Abs:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local DevProxTEAM = "\n" .."࿈ 𖡻 الدخول ↫ "..lock_Join.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الشبكات" then if DevAbs:get(DevProx..'Abs:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الشبكات ↫ "..lock_wp.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "المواقع" then if DevAbs:get(DevProx..'Abs:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 المواقع ↫ "..lock_location.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "العربيه" then if DevAbs:get(DevProx..'Abs:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 العربيه ↫ "..lock_arabic.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الانكليزيه" then if DevAbs:get(DevProx..'Abs:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local DevProxTEAM = "\n" .."࿈ 𖡻 الانكليزيه ↫ "..lock_english.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الكفر" then if DevAbs:get(DevProx..'Abs:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local DevProxTEAM = "\n" .."࿈ 𖡻 الكفر ↫ "..lock_kaf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الفشار" then if DevAbs:get(DevProx..'Abs:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local DevProxTEAM = "\n" .."࿈ 𖡻 الفشار ↫ "..lock_fshar.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
if text == "الطائفيه" then if DevAbs:get(DevProx..'Abs:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local DevProxTEAM = "\n" .."࿈ 𖡻 الطائفيه ↫ "..lock_taf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, DevProxTEAM, 1, 'md') end
end
--     Source AlOmDa     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:LockSettings'..msg.chat_id_) 
end
--     Source AlOmDa     --
if text == 'تفعيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل اوامر التحشيش'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:Stupid'..msg.chat_id_)
end
if text == 'تعطيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل اوامر التحشيش'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:Stupid'..msg.chat_id_,true)
end
--     Source AlOmDa     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:GpRed'..msg.chat_id_,true)
end
--     Source AlOmDa     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:AllRed'..msg.chat_id_,true)
end
--     Source AlOmDa     --
if SecondSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ⌁' then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."Abs:Left:Bot"..DevProx)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ⌁' then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."Abs:Left:Bot"..DevProx,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه ⌁' then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."Abs:Send:Bot"..DevProx)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه ⌁' then 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."Abs:Send:Bot"..DevProx,true) 
end
end
--     Source AlOmDa     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تغير اسم المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source AlOmDa     --
if msg.content_.photo_ then
if DevAbs:get(DevProx..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"࿈ 𖡻 عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevAbs:del(DevProx..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevAbs:del(DevProx..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تغير صورة المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevAbs:del(DevProx..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, '࿈ 𖡻 ارسل صورة المجموعه الان', 1, 'md')
DevAbs:set(DevProx..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source AlOmDa     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف صورة المجموعه")  
return false  
end
--     Source AlOmDa     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevAbs:sismember(DevProx.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "࿈ 𖡻 التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAbs:del(DevProx..'Abs:PinnedMsg'..msg.chat_id_)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم الغاء تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source AlOmDa     --
if text and text:match("^الغاء تثبيت الكل$") then  
if DevAbs:sismember(DevProx.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "࿈ 𖡻 التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم الغاء تثبيت الكل'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAbs:del(DevProx.."Abs:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"࿈ 𖡻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source AlOmDa     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevAbs:sismember(DevProx.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "࿈ 𖡻 التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local pin_id = DevAbs:get(DevProx..'Abs:PinnedMsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم اعادة تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source AlOmDa     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم طرد المحذوفين")  
end,nil)
end
--     Source AlOmDa     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Abs(msg.chat_id_, msg.id_, 0,'࿈ 𖡻 *لا يوجد محظورين*', 1, 'md')
DevAbs:del(DevProx..'Abs:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevAbs:del(DevProx..'Abs:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source AlOmDa     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevAbs:scard(DevProx.."Abs:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه ↫ ❨ '..dp.title_..' ❩\n࿈ 𖡻 الايدي ↫ ❨ '..msg.chat_id_..' ❩\n࿈ 𖡻 عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n࿈ 𖡻 عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n࿈ 𖡻 عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n࿈ 𖡻 عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n࿈ 𖡻 عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source AlOmDa     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطورين فقط', 1, 'md')
else
local ConstructorList = DevAbs:scard(DevProx.."Abs:Constructor:"..ChatId) or 0
local BanedList = DevAbs:scard(DevProx.."Abs:Ban:"..ChatId) or 0
local ManagerList = DevAbs:scard(DevProx.."Abs:Managers:"..ChatId) or 0
local MutedList = DevAbs:scard(DevProx.."Abs:Muted:"..ChatId) or 0
local TkeedList = DevAbs:scard(DevProx.."Abs:Abs:Tkeed:"..ChatId) or 0
local AdminsList = DevAbs:scard(DevProx.."Abs:Admins:"..ChatId) or 0
local VipList = DevAbs:scard(DevProx.."Abs:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/Dev_Prox' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Abs) 
if Abs.first_name_ ~= false then
ConstructorAbs = "["..Abs.first_name_.."](T.me/"..(Abs.username_ or "Dev_Prox")..")"
else 
ConstructorAbs = "حساب محذوف"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n࿈ 𖡻 الايدي ↫ ( `"..ChatId.."` )\n࿈ 𖡻 المنشئ ↫ "..ConstructorAbs.."\n࿈ 𖡻 عدد المدراء ↫ ( *"..ManagerList.."* )\n࿈ 𖡻 عدد المنشئين ↫ ( *"..ConstructorList.."* )\n࿈ 𖡻 عدد الادمنيه ↫ ( *"..AdminsList.."* )\n࿈ 𖡻 عدد المميزين ↫ ( *"..VipList.."* )\n࿈ 𖡻 عدد المحظورين ↫ ( *"..BanedList.."* )\n࿈ 𖡻 عدد المقيدين ↫ ( *"..TkeedList.."* )\n࿈ 𖡻 عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source AlOmDa     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 المجموعه ↫ ["..dp.title_.."]\n࿈ 𖡻 تمت المغادره منها بنجاح", 1, "md")
Dev_Abs(Text[2], 0, 1, "࿈ 𖡻 بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, DevProx)
DevAbs:srem(DevProx.."Abs:Groups", dp.id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source AlOmDa     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevAbs:set(DevProx..'Abs:Num:Add:Bot',Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source AlOmDa     --
if text == 'تفعيل البوت الخدمي' then 
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط', 1, 'md')
else 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:FreeBot'..DevProx) 
end 
end
if text == 'تعطيل البوت الخدمي' then 
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط', 1, 'md')
else 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:FreeBot'..DevProx,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx..'Abs:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx..'Abs:Lock:Games'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if Admin(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تفعيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(DevProx.."Abs:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if Admin(msg) then
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم تعطيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(DevProx.."Abs:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source AlOmDa     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAbs:get(DevProx..'Abs:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عدد اعضاء المجموعه اقل من ↫ *'..(DevAbs:get(DevProx..'Abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
DevAbs:del(DevProx..'Abs:AbsConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAbs:sadd(DevProx..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(DevProx.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:sadd(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(DevProx.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:srem(DevProx.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbs:sismember(DevProx..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","࿈ 𖡻 تم تفعيل المجموعه "..dp.title_)  
DevAbs:sadd(DevProx.."Abs:Groups",msg.chat_id_)
if not DevAbs:get(DevProx..'Abs:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAbs:incrby(DevProx..'Abs:Sudos'..msg.sender_user_id_,1)
DevAbs:set(DevProx..'Abs:SudosGp'..msg.sender_user_id_..msg.chat_id_,"abs")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(DevProx.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"࿈ 𖡻 تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 بواسطة ↫ "..Name.."\n࿈ 𖡻 اسم المجموعه ↫ ["..NameChat.."]\n࿈ 𖡻 عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n࿈ 𖡻 ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n࿈ 𖡻 رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الوقت ↫ "..os.date("%I:%M%p").."\n࿈ 𖡻 التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAbs:sismember(DevProx..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","࿈ 𖡻 تم تعطيل المجموعه "..dp.title_)  
DevAbs:srem(DevProx.."Abs:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(DevProx.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"࿈ 𖡻 تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 بواسطة ↫ "..Name.."\n࿈ 𖡻 اسم المجموعه ↫ ["..NameChat.."]\n࿈ 𖡻 ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n࿈ 𖡻 رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الوقت ↫ "..os.date("%I:%M%p").."\n࿈ 𖡻 التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source AlOmDa     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
if not Sudo(msg) then
SendText(DevId,"࿈ 𖡻 هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الشخص ↫ "..Name.."\n࿈ 𖡻 اسم المجموعه ↫ ["..NameChat.."]\n࿈ 𖡻 ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n࿈ 𖡻 رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الوقت ↫ "..os.date("%I:%M%p").."\n࿈ 𖡻 التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source AlOmDa     --
if text == 'جلب نسخه السورسميم' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './DevProx.lua', dl_cb, nil)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عزيزي المطور تم ارسال نسخة ملف السورس الى الخاص', 1, 'md')
end end
--     Source AlOmDa     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
local List = DevAbs:smembers(DevProx.."Abs:Groups")
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لا يوجد مجموعات مفعله', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 جاري ارسال نسخه تحتوي على '..#List..' مجموعه', 1, 'md')
local text = "࿈ 𖡻 Team AlomdA\n࿈ 𖡻 File Bot Groups\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local GroupsManagers = DevAbs:scard(DevProx.."Abs:Managers:"..v) or 0
local GroupsAdmins = DevAbs:scard(DevProx.."Abs:Admins:"..v) or 0
local Groupslink = DevAbs:get(DevProx.."Abs:Groups:Links" ..v)
text = text..k.." ↬ ⤈ \n࿈ 𖡻 Group ID ↬ "..v.."\n࿈ 𖡻 Group Link ↬ "..(Groupslink or "Not Found").."\n࿈ 𖡻 Group Managers ↬ "..GroupsManagers.."\n࿈ 𖡻 Group Admins ↬ "..GroupsAdmins.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(text)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(curl)
end
end
end
--     Source AlOmDa     --
if text == "اذاعه بالخاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(DevProx.."Abs:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n࿈ 𖡻 للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(DevProx.."Abs:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
List = DevAbs:smembers(DevProx..'Abs:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اذاعة "..AbsText.." بنجاح \n࿈ 𖡻 ‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AlOmDa     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(DevProx.."Abs:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n࿈ 𖡻 للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(DevProx.."Abs:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
List = DevAbs:smembers(DevProx..'Abs:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اذاعة "..AbsText.." بنجاح \n࿈ 𖡻 ‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AlOmDa     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(DevProx.."Abs:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 ارسل الرساله الان لتوجيها \n࿈ 𖡻 للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(DevProx.."Abs:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbs:smembers(DevProx..'Abs:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اذاعة رسالتك بالتوجيه \n࿈ 𖡻 ‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AlOmDa     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(DevProx.."Abs:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 ارسل الرساله الان لتوجيها \n࿈ 𖡻 للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(DevProx.."Abs:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbs:smembers(DevProx..'Abs:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اذاعة رسالتك بالتوجيه \n࿈ 𖡻 ‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source AlOmDa     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه بالتثبيت ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(DevProx.."Abs:Send:Bot"..DevProx) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"࿈ 𖡻 الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(DevProx.."Abs:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n࿈ 𖡻 للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(DevProx.."Abs:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local List = DevAbs:smembers(DevProx.."Abs:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAbs:set(DevProx..'Abs:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم اذاعة "..AbsText.." بالتثبيت \n࿈ 𖡻 ‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(DevProx.."Abs:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--     Source AlOmDa     --
if text == 'حذف رد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
DevAbs:set(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'DelGpRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد' and Manager(msg) and ChCheck(msg) then
DevAbs:set(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'SetGpRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAbs:get(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SetGpRed == 'SetGpRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n࿈ 𖡻 يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(DevProx..'Abs:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'','SaveGpRed')
DevAbs:set(DevProx..'Abs:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'',text)
DevAbs:sadd(DevProx..'Abs:Manager:GpRed'..msg.chat_id_..'',text)
DevAbs:set(DevProx..'DelManagerRep'..msg.chat_id_..'',text)
return false
end
end
--     Source AlOmDa     --
if text == 'حذف رد عام' and SecondSudo(msg) or text == '↫ حذف رد عام ⌁' and SecondSudo(msg) or text == 'مسح رد عام' and SecondSudo(msg) then
DevAbs:set(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد عام' and SecondSudo(msg) or text == '↫ اضف رد عام ⌁' and SecondSudo(msg) then
DevAbs:set(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAbs:get(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n࿈ 𖡻 يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(DevProx.."Abs:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAbs:set(DevProx.."Abs:Add:AllText"..msg.sender_user_id_, text)
DevAbs:sadd(DevProx.."Abs:Sudo:AllRed",text)
DevAbs:set(DevProx.."DelSudoRep",text)
return false 
end end
--     Source AlOmDa     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(DevProx..'Abs:Manager:GpRed'..msg.chat_id_..'')
MsgRep = '࿈ 𖡻 ردود المدير ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(DevProx.."Abs:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevAbs:get(DevProx.."Abs:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevAbs:get(DevProx.."Abs:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevAbs:get(DevProx.."Abs:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevAbs:get(DevProx.."Abs:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevAbs:get(DevProx.."Abs:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevAbs:get(DevProx.."Abs:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevAbs:get(DevProx.."Abs:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '࿈ 𖡻 لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source AlOmDa     --
if text == 'حذف الردود' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود' and Manager(msg) and ChCheck(msg) or text == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or text == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(DevProx..'Abs:Manager:GpRed'..msg.chat_id_..'')
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(DevProx..'Abs:Gif:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Voice:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Audio:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Photo:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Stecker:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Video:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:File:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Text:GpRed'..v..msg.chat_id_)
DevAbs:del(DevProx..'Abs:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف ردود المدير")  
return false
end
end
--     Source AlOmDa     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ⌁" and SecondSudo(msg) then
local redod = DevAbs:smembers(DevProx.."Abs:Sudo:AllRed")
MsgRep = '࿈ 𖡻 ردود المطور ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(DevProx.."Abs:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevAbs:get(DevProx.."Abs:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevAbs:get(DevProx.."Abs:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevAbs:get(DevProx.."Abs:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevAbs:get(DevProx.."Abs:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevAbs:get(DevProx.."Abs:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevAbs:get(DevProx.."Abs:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevAbs:get(DevProx.."Abs:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '࿈ 𖡻 لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source AlOmDa     --
if text == "حذف ردود المطور" and SecondSudo(msg) or text == "حذف ردود العام" and SecondSudo(msg) or text == "مسح ردود المطور" and SecondSudo(msg) then
local redod = DevAbs:smembers(DevProx.."Abs:Sudo:AllRed")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(DevProx.."Abs:Add:AllRed"..v)
DevAbs:del(DevProx.."Abs:Gif:AllRed"..v)
DevAbs:del(DevProx.."Abs:Voice:AllRed"..v)
DevAbs:del(DevProx.."Abs:Audio:AllRed"..v)
DevAbs:del(DevProx.."Abs:Photo:AllRed"..v)
DevAbs:del(DevProx.."Abs:Stecker:AllRed"..v)
DevAbs:del(DevProx.."Abs:Video:AllRed"..v)
DevAbs:del(DevProx.."Abs:File:AllRed"..v)
DevAbs:del(DevProx.."Abs:Text:AllRed"..v)
DevAbs:del(DevProx.."Abs:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","࿈ 𖡻 تم حذف ردود المطور")  
return false
end
end 
--     Source AlOmDa     --
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل لي اسم البوت الان" ,  1, "md") 
DevAbs:set(DevProx..'Abs:NameBot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(DevProx..'Abs:NameBot')
local DevProxTEAM = '࿈ 𖡻 اهلا عزيزي ↫ '..AbsRank(msg)..' \n࿈ 𖡻 تم حذف اسم البوت'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DevProxTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source AlOmDa     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) then
HelpList ={'Abs:Help','Abs:Help1','Abs:Help2','Abs:Help3','Abs:Help4','Abs:Help5','Abs:Help6'}
for i,Help in pairs(HelpList) do
DevAbs:del(DevProx..Help) 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (الاوامر) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help0'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:del(DevProx..'Abs:Help0'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "الاوامر" or text == "اوامر" or text == "مساعده" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر يخص الرتب الاعلى فقط\n࿈ 𖡻 ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help')
local text =  [[
࿈ 𖡻 اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 م1 ↫ اوامر الحمايه
࿈ 𖡻 م2 ↫ اوامر الادمنيه
࿈ 𖡻 م3 ↫ اوامر المدراء
࿈ 𖡻 م4 ↫ اوامر المنشئين
࿈ 𖡻 م5 ↫ اوامر المطورين
࿈ 𖡻 م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]] 
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
end
if text == "تعيين امر م1" and SecondSudo(msg) or text == "تعيين امر م١" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م1) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help01'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:del(DevProx..'Abs:Help01'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help1', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر يخص الرتب الاعلى فقط\n࿈ 𖡻 ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help1')
local text =  [[
࿈ 𖡻 اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 قفل • فتح ↫ الروابط
࿈ 𖡻 قفل • فتح ↫ المعرفات
࿈ 𖡻 قفل • فتح ↫ البوتات
࿈ 𖡻 قفل • فتح ↫ المتحركه
࿈ 𖡻 قفل • فتح ↫ الملصقات
࿈ 𖡻 قفل • فتح ↫ الملفات
࿈ 𖡻 قفل • فتح ↫ الصور
࿈ 𖡻 قفل • فتح ↫ الفيديو
࿈ 𖡻 قفل • فتح ↫ الاونلاين
࿈ 𖡻 قفل • فتح ↫ الدردشه
࿈ 𖡻 قفل • فتح ↫ التوجيه
࿈ 𖡻 قفل • فتح ↫ الاغاني
࿈ 𖡻 قفل • فتح ↫ الصوت
࿈ 𖡻 قفل • فتح ↫ الجهات
࿈ 𖡻 قفل • فتح ↫ الماركداون
࿈ 𖡻 قفل • فتح ↫ التكرار
࿈ 𖡻 قفل • فتح ↫ الهاشتاك
࿈ 𖡻 قفل • فتح ↫ التعديل
࿈ 𖡻 قفل • فتح ↫ التثبيت
࿈ 𖡻 قفل • فتح ↫ الاشعارات
࿈ 𖡻 قفل • فتح ↫ الكلايش
࿈ 𖡻 قفل • فتح ↫ الدخول
࿈ 𖡻 قفل • فتح ↫ الشبكات
࿈ 𖡻 قفل • فتح ↫ المواقع
࿈ 𖡻 قفل • فتح ↫ الفشار
࿈ 𖡻 قفل • فتح ↫ الكفر
࿈ 𖡻 قفل • فتح ↫ الطائفيه
࿈ 𖡻 قفل • فتح ↫ الكل
࿈ 𖡻 قفل • فتح ↫ العربيه
࿈ 𖡻 قفل • فتح ↫ الانكليزيه
࿈ 𖡻 قفل • فتح ↫ الفارسيه
࿈ 𖡻 قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 قفل • فتح + الامر ↫ ⤈
࿈ 𖡻 التكرار بالطرد
࿈ 𖡻 التكرار بالكتم
࿈ 𖡻 التكرار بالتقيد
࿈ 𖡻 الفارسيه بالطرد
࿈ 𖡻 البوتات بالطرد
࿈ 𖡻 البوتات بالتقيد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) or text == "تعيين امر م٢" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م2) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help21'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:del(DevProx..'Abs:Help21'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help2', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م2" or text == "م٢" or text == "اوامر2" or text == "اوامر٢" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر يخص الرتب الاعلى فقط\n࿈ 𖡻 ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help2')
local text =  [[
࿈ 𖡻 اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 الاعدادت
࿈ 𖡻 تاك للكل 
࿈ 𖡻 انشاء رابط
࿈ 𖡻 ضع وصف
࿈ 𖡻 ضع رابط
࿈ 𖡻 ضع صوره
࿈ 𖡻 حذف الرابط
࿈ 𖡻 حذف المطايه
࿈ 𖡻 كشف البوتات
࿈ 𖡻 طرد البوتات
࿈ 𖡻 تنظيف + العدد
࿈ 𖡻 تنظيف التعديل
࿈ 𖡻 كللهم + الكلمه
࿈ 𖡻 اسم البوت + الامر
࿈ 𖡻 ضع • حذف ↫ ترحيب
࿈ 𖡻 ضع • حذف ↫ قوانين
࿈ 𖡻 اضف • حذف ↫ صلاحيه
࿈ 𖡻 الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 ضع سبام + العدد
࿈ 𖡻 ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 رفع مميز • تنزيل مميز
࿈ 𖡻 المميزين • حذف المميزين
࿈ 𖡻 كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 حذف • مسح + بالرد
࿈ 𖡻 منع • الغاء منع
࿈ 𖡻 قائمه المنع
࿈ 𖡻 حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تفعيل • تعطيل ↫ الرابط
࿈ 𖡻 تفعيل • تعطيل ↫ الالعاب
࿈ 𖡻 تفعيل • تعطيل ↫ الترحيب
࿈ 𖡻 تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 طرد المحذوفين
࿈ 𖡻 طرد ↫ بالرد • بالمعرف • بالايدي
࿈ 𖡻 كتم • الغاء كتم
࿈ 𖡻 تقيد • الغاء تقيد
࿈ 𖡻 حظر • الغاء حظر
࿈ 𖡻 المكتومين • حذف المكتومين
࿈ 𖡻 المقيدين • حذف المقيدين
࿈ 𖡻 المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تقييد دقيقه + عدد الدقائق
࿈ 𖡻 تقييد ساعه + عدد الساعات
࿈ 𖡻 تقييد يوم + عدد الايام
࿈ 𖡻 الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) or text == "تعيين امر م٣" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م3) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help31'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:del(DevProx..'Abs:Help31'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help3', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م3" or text == "م٣" or text == "اوامر3" or text == "اوامر٣" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر يخص الرتب الاعلى فقط\n࿈ 𖡻 ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help3')
local text =  [[
࿈ 𖡻 اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 فحص البوت
࿈ 𖡻 ضع اسم + الاسم
࿈ 𖡻 اضف • حذف ↫ رد
࿈ 𖡻 ردود المدير
࿈ 𖡻 حذف ردود المدير
࿈ 𖡻 حذف قوائم المنع
࿈ 𖡻 منع ↫ بالرد على ( ملصق • صوره • متحركه )
࿈ 𖡻 حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تنزيل الكل
࿈ 𖡻 رفع ادمن • تنزيل ادمن
࿈ 𖡻 الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تثبيت
࿈ 𖡻 الغاء التثبيت
࿈ 𖡻 اعاده التثبيت
࿈ 𖡻 الغاء تثبيت الكل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تغير رد + اسم الرتبه + النص ↫ ⤈
࿈ 𖡻 المطور • منشئ الاساسي
࿈ 𖡻 المنشئ • المدير • الادمن
࿈ 𖡻 المميز • المنظف • العضو
࿈ 𖡻 حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تغيير الايدي ↫ لتغيير الكليشه
࿈ 𖡻 تعيين الايدي ↫ لتعيين الكليشه
࿈ 𖡻 حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تفعيل • تعطيل + الامر ↫ ⤈
࿈ 𖡻 اطردني • الايدي بالصوره • الابراج
࿈ 𖡻 معاني الاسماء • اوامر النسب
࿈ 𖡻 الايدي • تحويل الصيغ • اوامر التحشيش
࿈ 𖡻 ردود المدير • ردود المطور
࿈ 𖡻 ضافني • حساب العمر • الزخرفه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "تعيين امر م4" and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م4) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help41'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده" ,  1, "md")
DevAbs:del(DevProx..'Abs:Help41'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help4', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م٤" or text == "م4" or text == "اوامر4" or text == "اوامر٤" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر يخص الرتب الاعلى فقط\n࿈ 𖡻 ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help4')
local text =  [[
࿈ 𖡻 اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تنزيل الكل
࿈ 𖡻 الميديا • امسح
࿈ 𖡻 اضف • حذف ↫ امر
࿈ 𖡻 حذف الاوامر المضافه
࿈ 𖡻 الاوامر المضافه
࿈ 𖡻 اضف نقاط ↫ بالرد • بالايدي
࿈ 𖡻 اضف رسائل ↫ بالرد • بالايدي
࿈ 𖡻 رفع منظف • تنزيل منظف
࿈ 𖡻 المنظفين • حذف المنظفين
࿈ 𖡻 رفع مدير • تنزيل مدير
࿈ 𖡻 المدراء • حذف المدراء
࿈ 𖡻 تفعيل • تعطيل + الامر ↫ ⤈
࿈ 𖡻 نزلني • امسح
࿈ 𖡻 الحظر • الكتم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 وضع لقب + اللقب
࿈ 𖡻 تفعيل • تعطيل ↫ الرفع
࿈ 𖡻 رفع منشئ • تنزيل منشئ
࿈ 𖡻 المنشئين • حذف المنشئين
࿈ 𖡻 رفع • تنزيل ↫ مشرف
࿈ 𖡻 رفع بكل الصلاحيات
࿈ 𖡻 حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 اوامر منشئ المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 رفع • تنزيل ↫ منشئ اساسي
࿈ 𖡻 حذف المنشئين الاساسيين 
࿈ 𖡻 المنشئين الاساسيين 
࿈ 𖡻 حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) or text == "تعيين امر م٥" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م5) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help51'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده " ,  1, "md")
DevAbs:del(DevProx..'Abs:Help51'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help5', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م٥" or text == "م5" or text == "اوامر5" or text == "اوامر٥" then
if not SudoBot(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevAbs:get(DevProx..'Abs:Help5')
local text =  [[
࿈ 𖡻 اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 الكروبات
࿈ 𖡻 المطورين
࿈ 𖡻 المشتركين
࿈ 𖡻 الاحصائيات
࿈ 𖡻 المجموعات
࿈ 𖡻 اسم البوت + غادر
࿈ 𖡻 اسم البوت + تعطيل
࿈ 𖡻 كشف + -ايدي المجموعه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 رفع • تنزيل ↫ مدير عام
࿈ 𖡻 حذف • المدراء العامين 
࿈ 𖡻 رفع • تنزيل ↫ ادمن عام
࿈ 𖡻 حذف • الادمنيه العامين 
࿈ 𖡻 رفع • تنزيل ↫ مميز عام
࿈ 𖡻 حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تحديث
࿈ 𖡻 الملفات
࿈ 𖡻 المتجر
࿈ 𖡻 روابط الكروبات
࿈ 𖡻 تحديث السورس
࿈ 𖡻 تنظيف الكروبات
࿈ 𖡻 تنظيف المشتركين
࿈ 𖡻 حذف جميع الملفات
࿈ 𖡻 تعيين الايدي العام
࿈ 𖡻 تغير المطور الاساسي
࿈ 𖡻 حذف معلومات الترحيب
࿈ 𖡻 تغير معلومات الترحيب
࿈ 𖡻 غادر + -ايدي المجموعه
࿈ 𖡻 تعيين عدد الاعضاء + العدد
࿈ 𖡻 حظر عام • الغاء العام
࿈ 𖡻 كتم عام • الغاء العام
࿈ 𖡻 قائمه العام • حذف قائمه العام
࿈ 𖡻 وضع • حذف ↫ اسم البوت
࿈ 𖡻 اضف • حذف ↫ رد عام
࿈ 𖡻 ردود المطور • حذف ردود المطور
࿈ 𖡻 تعيين • حذف • جلب ↫ رد الخاص
࿈ 𖡻 رفع النسخه + بالرد على الملف
࿈ 𖡻 رفع • تنزيل ↫ مطور
࿈ 𖡻 المطورين • حذف المطورين
࿈ 𖡻 رفع • تنزيل ↫ مطور ثانوي
࿈ 𖡻 الثانويين • حذف الثانويين
࿈ 𖡻 تعيين • حذف ↫ كليشة الايدي
࿈ 𖡻 اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 تفعيل ملف + اسم الملف
࿈ 𖡻 تعطيل ملف + اسم الملف
࿈ 𖡻 تفعيل • تعطيل + الامر ↫ ⤈
࿈ 𖡻 الاذاعه • الاشتراك الاجباري
࿈ 𖡻 ترحيب البوت • المغادره
࿈ 𖡻 البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) or text == "تعيين امر م٦" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة (م6) الان " ,  1, "md")
DevAbs:set(DevProx..'Abs:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local DevProxTEAM =  DevAbs:get(DevProx..'Abs:Help61'..msg.sender_user_id_)
if DevProxTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ الكليشه الجديده" ,  1, "md")
DevAbs:del(DevProx..'Abs:Help61'..msg.sender_user_id_)
DevAbs:set(DevProx..'Abs:Help6', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text == "م٦" or text == "م6" or text == "اوامر6" or text == "اوامر٦" then
local Help = DevAbs:get(DevProx..'Abs:Help6')
local text =  [[
࿈ 𖡻 اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 السورس • موقعي • رتبتي • معلوماتي
࿈ 𖡻 رسائلي • حذف رسائلي • اسمي • معرفي 
࿈ 𖡻 ايدي •ايديي • جهاتي • غنيلي • الالعاب 
࿈ 𖡻 نقاطي • بيع نقاطي • القوانين • زخرفه 
࿈ 𖡻 رابط الحذف • نزلني • اطردني • المطور 
࿈ 𖡻 منو ضافني • مشاهدات المنشور • الرابط 
࿈ 𖡻 ايدي المجموعه • معلومات المجموعه 
࿈ 𖡻 نسبه الحب • نسبه الكره • نسبه الغباء 
࿈ 𖡻 نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 صلاحياتي
࿈ 𖡻 كول + الكلمه
࿈ 𖡻 زخرفه + اسمك
࿈ 𖡻 برج + نوع البرج
࿈ 𖡻 معنى اسم + الاسم
࿈ 𖡻 احسب + تاريخ ميلادك
࿈ 𖡻 بوسه • بوسها ↫ بالرد
࿈ 𖡻 رفع مطي • تنزيل مطي •المطايه
࿈ 𖡻 هينه • هينها ↫ بالرد • بالمعرف
࿈ 𖡻 صيحه • صيحها ↫ بالرد • بالمعرف
࿈ 𖡻 صلاحياته ↫ بالرد • بالمعرف • بالايدي
࿈ 𖡻 ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
࿈ 𖡻 تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
࿈ 𖡻 [Source Channel](https://t.me/Src_Web)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
--     Source AlOmDa     --
if SecondSudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 جاري تحديث سورس تيم العمده', 1, 'md') 
os.execute('rm -rf DevProx.lua') 
os.execute('wget https://raw.githubusercontent.com/TeamAlomdA/DevProx/master/DevProx.lua') 
dofile('DevProx.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث ⌁' then  
dofile('DevProx.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم تحديث ملفات البوت", 1, "md")
end 
if text == 'تصحيح الاخطاء' then
if not DevAbs:get(DevProx..'Abs:Errors') then
DevAbs:set(DevProx..'Abs:Errors',true)
send(msg.chat_id_, msg.id_,'࿈ 𖡻 تم تصحيح اخطاء التحديث القديم')
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = DevId,
TokenBot = TokenBot,
DevProx = TokenBot:match("(%d+)"),
SudoIds = {DevId},
}
Create(Config, "./config.lua")   
file = io.open("DevProx.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DevProx
token="]]..TokenBot..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./DevProx.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DevProx
while(true) do
rm -fr ../.telegram-cli
screen -S DevProx -X kill
screen -S DevProx ./DevProx.sh
done
]]) 
file:close() 
os.execute('unlink RUNABS.sh;unlink ABS;chmod +x DevProx.sh;chmod +x Run;./Run')
else
send(msg.chat_id_, msg.id_,'࿈ 𖡻 لديك اخر نسخه من التحديث لاتوجد اخطاء')
end
end
--     Source AlOmDa     --
if text == 'الملفات' then
Files = '\n࿈ 𖡻 الملفات المفعله في البوت ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '࿈ 𖡻 لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/TeamAlomdA/DevProxFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n࿈ 𖡻 قائمة ملفات متجر سورس العمده\n࿈ 𖡻 الملفات المتوفره حاليا ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
local TextE = "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 علامة ↫ (✔) تعني الملف مفعل\n࿈ 𖡻 علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."࿈ 𖡻 "..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"࿈ 𖡻 لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"࿈ 𖡻 تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/TeamAlomdA/DevProxFiles/master/DevProxFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\n࿈ 𖡻 الملف ↫ *"..FileName.."*\n࿈ 𖡻 تم تعطيله وحذفه من البوت بنجاح") 
dofile('DevProx.lua')  
else
send(msg.chat_id_, msg.id_,"࿈ 𖡻 لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/TeamAlomdA/DevProxFiles/master/DevProxFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n࿈ 𖡻 الملف ↫ *"..FileName.."*\n࿈ 𖡻 تم تفعيله في البوت بنجاح") 
dofile('DevProx.lua')  
else
send(msg.chat_id_, msg.id_,"࿈ 𖡻 لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     Source AlOmDa     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم حذف معلومات الترحيب', 1, 'md')   
DevAbs:del(DevProx..'Abs:Text:BotWelcome')
DevAbs:del(DevProx..'Abs:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbs:del(DevProx..'Abs:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbs:set(DevProx..'Abs:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب ⌁') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 ارسل لي نص الترحيب', 1, 'md') 
DevAbs:del(DevProx..'Abs:Text:BotWelcome')
DevAbs:del(DevProx..'Abs:Photo:BotWelcome')
DevAbs:set(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAbs:get(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء الامر", 1, "md") 
DevAbs:del(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ النص ارسل لي صورة الترحيب\n࿈ 𖡻 ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevAbs:set(DevProx.."Abs:Text:BotWelcome",text) 
DevAbs:set(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAbs:get(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevAbs:del(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAbs:set(DevProx.."Abs:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حفظ النص وصورة الترحيب", 1, 'md')   
DevAbs:del(DevProx.."Abs:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source AlOmDa     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 ارسل كليشة المطور الان ", 1, "md")
DevAbs:setex(DevProx.."Abs:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم حذف كليشة المطور", 1, "md")
DevAbs:del(DevProx.."DevText")
end end
--     Source AlOmDa     --
if DevAbs:get(DevProx.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "࿈ 𖡻 تم الغاء الامر", 1, "md") 
DevAbs:del(DevProx.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del(DevProx.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAbs:set(DevProx..'Abs:textch:user',texxt)
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراكميم$") and SecondSudo(msg) or text and text:match("^تغيير كليشه الاشتراكميم$") and SecondSudo(msg) then  
DevAbs:setex(DevProx.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
local text = '࿈ 𖡻 حسنا ارسل كليشة الاشتراك الجديده'  
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباريميم" or text == "حذف كليشه الاشتراكميم" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(DevProx..'Abs:textch:user')
textt = "࿈ 𖡻 تم حذف كليشة الاشتراك الاجباري"
Dev_Abs(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevAbs:get(DevProx.."Abs:textch:user")
if chtext then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 كليشة الاشتراك ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
local DevAbs6 = DevAbs:get(DevProx.."DevAbs3")
if DevAbs6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 عليك الاشتراك في قناة البوت \n࿈ 𖡻 قناة البوت ↫ '..DevAbs6, 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 لم يتم تعيين قناة الاشتراك الاجباري \n࿈ 𖡻 ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source AlOmDa     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '࿈ 𖡻 Channel ↬ @Src_Web', 1, 'html')    
end 
--     Source AlOmDa     --
if Sudo(msg) then 
if text == 'سيرفر ميم' or text == 'سيرفرميم' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '࿈ 𖡻 نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source AlOmDa     --
DevProxFiles(msg)
--     Source AlOmDa     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAbs:incr(DevProx..'Abs:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageSticker" then Media = 'الملصق'
elseif result.content_.ID == "MessageVoice" then Media = 'البصمه'
elseif result.content_.ID == "MessageAudio" then Media = 'الصوت'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local absname = '࿈ 𖡻 العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
local absid = '࿈ 𖡻 ايديه ↫ `'..dp.id_..'`'
local abstext = '࿈ 𖡻 قام بالتعديل على '..Media
local abstxt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n࿈ 𖡻 تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_  
text = '\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, absname..'\n'..absid..'\n'..abstext..text..abstxt,0,'md') 
end
end,nil)
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAbs:get(DevProx..'Abs:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source AlOmDa     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAbs:get(DevProx..'Abs:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAbs:del(DevProx..'Abs:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(DevProx..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(DevProx..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(DevProx..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source AlOmDa     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevAbs:smembers(DevProx..'Abs:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAbs:smembers(DevProx..'Abs:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=DevProx,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAbs:srem(DevProx..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbs:srem(DevProx..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbs:srem(DevProx..'Abs:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAbs:srem(DevProx..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(DevProx..'Abs:Groups',v)  
end end,nil) end
end
--     Source AlOmDa     --
end 
------------------------------------------------
-- This Source Was Developed By (MeM) @IVEN4.--
--   This Is The Source Channel @Src_Web .   --
--                - AlomDa -                 --
--        -- https://t.me/Src_Web --         --
------------------------------------------------ 
