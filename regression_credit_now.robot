*** Settings ***
Library         Selenium2Library
Library         ExcelLibrary
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library	        String

*** Variables ***
${ejurl}        https://i9ihxtr2n4.execute-api.ap-southeast-1.amazonaws.com
${ejpath}       /api/enquery
${ejapikey}     ob5sV275QLRBHQx4nC9LLezPvIWxwjadvGPIyD80
${fleeturl}     https://fleet-api-uat.minordigital.com
${fleetpath}    /v1/delivery?order_no=
${example_regex}=  SEPARATOR=
...     Order via 1112delivery from (201997 - PZ-LAB @AVANI-201998-WIN10)\n
...     Remark: Master ID: 2000078370\n
...     Tax Invoice\n
...     Name: Minor,\n
...     Address: 257 Charoen Nakorn Rd. Samrae, Thonburi, Bangkok 10600,\n
...     Branch ID: 1001,\n
...     Tax ID: 1000000000001,

*** Test Cases ***
0.Open Chrome
    Close All Browsers
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size  1920  1080

1.Login Success
    # Go To    https://fe-uat.1112one.com/
    Open Browser    https://fe-uat.1112one.com/     gc
	Maximize Browser Window
	Wait Until Element Is Visible       xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[2]/a      timeout=30s
	Click Element      xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[2]/a
	# Wait Until Page Contains    Swensen
    Wait Until Element Is Visible      class=cookies-close     timeout=30s
	Click Element       class=cookies-close
	Click Link          xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[1]/a[1]
	Wait Until Page Contains     Connect with facebook
	Input Text          username    tonaor.dlnaja@ismilebot.com
    Input Text          password    123456
    Wait Until Element Is Visible       xpath=//*[@id="signin"]/div/div/div/div[1]/form/div[6]/button       timeout=30s
    Click Element       xpath=//*[@id="signin"]/div/div/div/div[1]/form/div[6]/button
    sleep	3
    # Wait Until Element Is Visible     xpath=/html/body/div[2]/div[1]/div[2]/a     timeout=30s
    # Click Element       xpath=/html/body/div[2]/div[1]/div[2]/a
	Execute Javascript	window.scrollTo(0,500);

2.select address
    Wait Until Element Is Visible       xpath=/html/body/div[1]/header/div[1]/div/div/div[1]       timeout=30s
    Click Element       xpath=/html/body/div[1]/header/div[1]/div/div/div[1]
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[2]/div/div/div/div[1]/div[2]/div[2]     timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[2]/div/div/div/div[1]/div[2]/div[2]
    sleep	3
    Wait Until Element Is Visible     xpath=/html/body/div[1]/section[1]/section[2]/div/div/div/div[1]/div[2]/div[1]/div/ul/li[3]     timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[2]/div/div/div/div[1]/div[2]/div[1]/div/ul/li[3]
    sleep   3
	Execute Javascript	window.scrollTo(0,500);

3.Pizza
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[4]/div/div/div[1]      timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[4]/div/div/div[1]
    sleep	3
	Execute Javascript	window.scrollTo(0,450);

4.Appetizers
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[1]/h3[4]      timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[1]/h3[4]
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[6]/div/div[2]/div[2]/div/div[2]/button[1]      timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[6]/div/div[2]/div[2]/div/div[2]/button[1]
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[6]/div/div[3]/div[2]/div/div[2]/button[1]         timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[6]/div/div[3]/div[2]/div/div[2]/button[1]

5.Chicken
    sleep   3
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[1]/h3[5]      timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[1]/h3[5]
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[7]/div/div[2]/div[2]/div/div[2]/button[1]        timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[7]/div/div[2]/div[2]/div/div[2]/button[1]
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section[3]/div/div[7]/div/div[3]/div[2]/div/div[2]/button[1]     timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section[3]/div/div[7]/div/div[3]/div[2]/div/div[2]/button[1]

6.My cart
    sleep	3
    Wait Until Element Is Visible       xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[3]/div/a     timeout=30s
    Click Element       xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[3]/div/a
    Wait Until Element Is Visible       xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[3]/div/div/div[3]/div[3]/a        timeout=30s
    Click Element       xpath=/html/body/div[1]/header/div[1]/div/div/div[2]/div[2]/div/ul/li[3]/div/div/div[3]/div[3]/a

7.Now Delivery
    sleep	3
	Execute Javascript	window.scrollTo(0,600);
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section/div/div[2]/div[2]/div/div[3]/button      timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section/div/div[2]/div[2]/div/div[3]/button

8.Checkout Credit
    # sleep	5
    # Execute Javascript    document.getElementsByClassName("bg-transparent mt20")[0].scrollIntoView(false);
    sleep	3
	Execute Javascript	window.scrollTo(0,1000);
    sleep   3
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[1]/div[1]/div[2]        timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[1]/div[1]/div[2]
    sleep   3
    Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[3]/button        timeout=30s
    Click Element       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[3]/button

# Request Tax Invoice
#     Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[2]/div[1]/label/span[1]     timeout=30s
#     Click Element       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[2]/div[1]/label/span[1]
#     Input Text          TaxCompanyName      Minor
#     Input Text          TaxNumber           1000000000001
#     Input Text          TaxBranch           1001
#     Input Text          TaxCustomerAddress  257 Charoen Nakorn Rd. Samrae, Thonburi, Bangkok 10600
#     Wait Until Element Is Visible       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[3]/button     timeout=30s
#     Click Element       xpath=/html/body/div[1]/section[1]/section/div/div/div/div[4]/div[3]/button
    # sleep	10
    # Handle Alert       action=ACCEPT    timeout=10
    # # Execute Javascript	window.scrollTo(0,800);
    # sleep	10

# start here
9.Get Order Tracker
    Wait Until Location Contains    https://fe-uat.1112one.com/profile/tracker    timeout=30s
    sleep	5
    ${getorderid}  Get Text    //*[@id="profile"]/div[2]/div/div/div[3]/div[1]/div[1]/div/h1       #เลข order number
	${removeorder}=    Remove String    ${getorderid}    Order Number
	${masterorder}=       Remove String    ${removeorder.strip()}
	Set Global Variable      ${masterorder}

	Scroll Element Into View    //*[@id="profile"]/div[2]/div/div/div[3]/div[6]/div[2]/div[3]/table/tbody/tr/td[1]       #elementคำว่า total
	${getsubtotal}  Get Text  //*[@id="profile"]/div[2]/div/div/div[3]/div[6]/div[2]/div[3]/table/tbody/tr/td[2]        #elementค่า subtotal
	${removesub}=    Remove String    ${getsubtotal}    ฿
	${subtotalprice}=       Remove String    ${removesub.strip()}
	Set Global Variable      ${subtotalprice}

	${getdeliveryfee}  Get Text  //*[@id="profile"]/div[2]/div/div/div[3]/div[3]     #elementค่า Delivery
	${removedf}=    Remove String    ${getdeliveryfee}      ฿
	${df}=          Remove String    ${removedf.strip()}
    ${df}=          Evaluate    '${df}'.replace('Delivery Fee: ','')        #ตัดคำว่า Delivery Fee ออก
	Set Global Variable      ${df}

	${gettotal}  Get Text   //*[@id="profile"]/div[2]/div/div/div[3]/div[4]/p/b       #element ค่า total
	${removetotal}=    Remove String    ${gettotal}    +  ฿
	${total}=       Remove String    ${removetotal.strip()}
    ${total}=       Evaluate    '${total}'.replace('Total: ','')        #ตัดคำว่า Total ออก
	Set Global Variable      ${total}

	Close Browser

10.Get order from EJ Success
    &{body}=        Create Dictionary  order_id=${masterorder}
    &{headers}      Create Dictionary  Content-Type=application/json  X-API-Key=${ejapikey}
    Create Session  URL     ${ejurl}
    ${resp}=        POST On Session  URL  ${ejpath}  json=${body}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200

11.Have correct order info (Master Bill)
    &{body}=        Create Dictionary  order_id=${masterorder}
    &{headers}      Create Dictionary  Content-Type=application/json  X-API-Key=${ejapikey}
    Create Session  URL  ${ejurl}
    ${resp}=        POST On Session  URL  ${ejpath}  json=${body}  headers=${headers}

    ${brand}=  Get Value From Json  ${resp.json()}[0]  brand
    ${brandFromList}=  Get From List  ${brand}  0
    Should be equal  ${brandFromList}  1112D

    ${payment_type}=  Get Value From Json  ${resp.json()}[0]  payment_type
    ${paymentFromList}=  Get From List  ${payment_type}  0
    Should be equal  ${paymentFromList}  Credit

    ${channel_name}=  Get Value From Json  ${resp.json()}[0]  channel_name
    ${channelFromList}=  Get From List  ${channel_name}  0
    Should be equal  ${channelFromList}  1112D

    ${sub_channel_name}=  Get Value From Json  ${resp.json()}[0]  sub_channel_name
    ${subchannelFromList}=  Get From List  ${sub_channel_name}  0
    Should be equal  ${subchannelFromList}  WEB

    ${is_master_bill}=  Get Value From Json  ${resp.json()}[0]  is_master_bill
    ${masterbillFromList}=  Get From List  ${is_master_bill}  0
    Should Be Equal As Strings  ${masterbillFromList}  True

    ${tender_id}=  Get Value From Json  ${resp.json()}[0]  tender_id
    ${tenderidFromList}=  Get From List  ${tender_id}  0
    Should Be Equal As Strings  ${tenderidFromList}  198

    ${order_amount}=  Get Value From Json  ${resp.json()}[0]  order_amount
    ${orderamountFromList}=  Get From List  ${order_amount}  0
    ${orderamount}=  Convert to Integer   ${orderamountFromList}
    Should Be Equal As Strings  ${orderamount}  ${total}

12.Have correct order info (PZ)
    &{body}=        Create Dictionary  order_id=${masterorder}
    &{headers}      Create Dictionary  Content-Type=application/json  X-API-Key=${ejapikey}
    Create Session  URL  ${ejurl}
    ${resp}=        POST On Session  URL  ${ejpath}  json=${body}  headers=${headers}

    ${getorderid}=  Get Value From Json  ${resp.json()}[1]  order_id
    ${orderidpz}=  Get From List  ${getorderid}  0
    Set Global Variable      ${orderidpz}

    ${brand}=  Get Value From Json  ${resp.json()}[1]  brand
    ${billbrandFromList}=  Get From List  ${brand}  0
    Should be equal  ${billbrandFromList}  PZ
    Set Global Variable      ${billbrandFromList}

    Log To Console  ${resp.json()}
    ${payment_type}=  Get Value From Json  ${resp.json()}[1]  payment_type
    ${paymentFromList}=  Get From List  ${payment_type}  0
    Should be equal  ${paymentFromList}  Credit

    ${channel_name}=  Get Value From Json  ${resp.json()}[1]  channel_name
    ${channelFromList}=  Get From List  ${channel_name}  0
    Should be equal  ${channelFromList}  1112D

    ${sub_channel_name}=  Get Value From Json  ${resp.json()}[1]  sub_channel_name
    ${subchannelFromList}=  Get From List  ${sub_channel_name}  0
    Should be equal  ${subchannelFromList}  WEB

    ${is_master_bill}=  Get Value From Json  ${resp.json()}[1]  is_master_bill
    ${masterbillFromList}=  Get From List  ${is_master_bill}  0
    Should Be Equal As Strings  ${masterbillFromList}  False

    ${tender_id}=  Get Value From Json  ${resp.json()}[1]  tender_id
    ${tenderidFromList}=  Get From List  ${tender_id}  0
    Should Be Equal As Strings  ${tenderidFromList}  198

    ${order_amount}=  Get Value From Json  ${resp.json()}[1]  order_amount
    ${orderamountFromList}=  Get From List  ${order_amount}  0
    ${orderamount}=  Convert to Integer   ${orderamountFromList}
    Should Be Equal As Strings  ${orderamount}  ${subtotalprice}

    # ${taxinvoice}=  Get Value From Json  ${resp.json()}[1]  order_obj.Notes.CNote[0].NT_FREE_TEXT
    # ${taxinvoiceFromList}=  Get From List  ${taxinvoice}  0
    # Should Be Equal  ${taxinvoiceFromList}  Order via 1112delivery from (201997 - PZ-LAB @AVANI-201998-WIN10)\nRemark: Master ID: ${masterorder}\nTax Invoice\nName: Minor,\nAddress: 257 Charoen Nakorn Rd. Samrae, Thonburi, Bangkok 10600,\nBranch ID: 1001,\nTax ID: 1000000000001,\n

    # Log To Console  ${resp.json()}
    # ${cutlery}=  Get Value From Json  ${resp.json()}[1]   order_obj.Entries.CEntry[4].Name
    # ${cutleryFromList}=  Get From List  ${cutlery}  0
    # Should be equal  ${cutleryFromList}  PZ-*Plastic Cutlery

    # Log To Console  ${resp.json()}
    # ${cutlery}=  Get Value From Json  ${resp.json()}[1]   order_obj.Entries.CEntry[5].Name
    # ${cutleryFromList}=  Get From List  ${cutlery}  0
    # Should be equal  ${cutleryFromList}  PZ-*Sauce

13.Have correct order info (DF)
    &{body}=        Create Dictionary  order_id=${masterorder}
    &{headers}      Create Dictionary  Content-Type=application/json  X-API-Key=${ejapikey}
    Create Session  URL  ${ejurl}
    ${resp}=        POST On Session  URL  ${ejpath}  json=${body}  headers=${headers}

    ${brand}=  Get Value From Json  ${resp.json()}[2]  brand
    ${brandFromList}=  Get From List  ${brand}  0
    Should be equal  ${brandFromList}  DF

    Log To Console  ${resp.json()}
    ${payment_type}=  Get Value From Json  ${resp.json()}[2]  payment_type
    ${paymentFromList}=  Get From List  ${payment_type}  0
    Should be equal  ${paymentFromList}  Credit

    ${channel_name}=  Get Value From Json  ${resp.json()}[2]  channel_name
    ${channelFromList}=  Get From List  ${channel_name}  0
    Should be equal  ${channelFromList}  1112D

    ${sub_channel_name}=  Get Value From Json  ${resp.json()}[2]  sub_channel_name
    ${subchannelFromList}=  Get From List  ${sub_channel_name}  0
    Should be equal  ${subchannelFromList}  WEB

    ${is_master_bill}=  Get Value From Json  ${resp.json()}[2]  is_master_bill
    ${masterbillFromList}=  Get From List  ${is_master_bill}  0
    Should Be Equal As Strings  ${masterbillFromList}  False

    ${tender_id}=  Get Value From Json  ${resp.json()}[2]  tender_id
    ${tenderidFromList}=  Get From List  ${tender_id}  0
    Should Be Equal As Strings  ${tenderidFromList}  198

    ${order_amount}=  Get Value From Json  ${resp.json()}[2]  order_amount
    ${orderamountFromList}=  Get From List  ${order_amount}  0
    ${orderamount}=  Convert to Integer   ${orderamountFromList}
    Should Be Equal As Strings  ${orderamount}  ${df}

    ${order_obj_itemprice}=  Get Value From Json  ${resp.json()}[2]  order_obj.Entries[1].Price
    ${itempriceFromList}=  Get From List  ${order_obj_itemprice}    0
    Should Be Equal As Strings  ${itempriceFromList}  ${df}

    # Log To Console  ${resp.json()}       #gen log ออก
    # ${taxinvoice}=      Get Value From Json     ${resp.json()}[1]   order_obj.Notes.CNote[0].NT_FREE_TEXT
    # ${taxinvoiceFromList}=      Get From List   ${taxinvoice}   0
    # Should Be Equal     ${taxinvoiceFromList}   Order via 1112delivery from (201997 - PZ-LAB @AVANI-201998-WIN10)\nRemark: Master ID: ${masterorder}\nTax Invoice\nName: Minor,\nAddress: 257 Charoen Nakorn Rd. Samrae, Thonburi, Bangkok 10600,\nBranch ID: 1001,\nTax ID: 1000000000001,\n

14.Get order from fleet success
    &{headers}      Create Dictionary  Content-Type=application/json
    Create Session  URL  ${fleeturl}
    ${resp}=        GET On Session  URL  ${fleetpath}${masterorder}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200

15.Have correct fleet order detail
    &{headers}      Create Dictionary  Content-Type=application/json
    Create Session  URL  ${fleeturl}
    ${resp}=        GET On Session  URL  ${fleetpath}${masterorder}  headers=${headers}

    ${master_order_id}=  Get Value From Json  ${resp.json()}  data[0].master_order_id
    ${masterorderFromList}=  Get From List  ${master_order_id}  0
    Should Be Equal As Strings  ${masterorderFromList}  ${masterorder}

    ${order_id}=  Get Value From Json  ${resp.json()}  data[0].order_id
    ${orderFromList}=  Get From List  ${order_id}  0
    Should Be Equal As Strings  ${orderFromList}  ${orderidpz}

    ${order_no}=  Get Value From Json  ${resp.json()}  data[0].order_no
    ${ordernoFromList}=  Get From List  ${order_no}  0
    Should Be Equal As Strings  ${ordernoFromList}  ${masterorder}_${orderidpz}_${billbrandFromList}

    Log To Console  ${resp.json()}
    ${payment_type}=  Get Value From Json  ${resp.json()}  data[0].payment_type
    ${paymentFromList}=  Get From List  ${payment_type}  0
    Should be equal  ${paymentFromList}  Prepaid

    ${channel}=  Get Value From Json  ${resp.json()}  data[0].channel
    ${channelFromList}=  Get From List  ${channel}  0
    Should be equal  ${channelFromList}  1112D

    # ${taxname}=  Get Value From Json  ${resp.json()}  data[0].tax_receipt.name
    # ${taxnameFromList}=  Get From List  ${taxname}  0
    # Should Be Equal  ${taxnameFromList}     Minor

    # ${taxid}=  Get Value From Json  ${resp.json()}  data[0].tax_receipt.id
    # ${taxidFromList}=  Get From List  ${taxid}  0
    # Should Be Equal  ${taxidFromList}   1000000000001

    # ${taxbranch}=  Get Value From Json  ${resp.json()}  data[0].tax_receipt.branch_id
    # ${taxbranchFromList}=  Get From List  ${taxbranch}  0
    # Should Be Equal  ${taxbranchFromList}   1001

    # ${taxaddr}=  Get Value From Json  ${resp.json()}  data[0].tax_receipt.address
    # ${taxaddrFromList}=  Get From List  ${taxaddr}  0
    # Should Be Equal  ${taxaddrFromList}     257 Charoen Nakorn Rd. Samrae, Thonburi, Bangkok 10600

    # Log To Console  ${resp.json()}
    # ${cutlery}=  Get Value From Json  ${resp.json()}  data[0].item[3].name_en
    # ${cutleryFromList}=  Get From List  ${cutlery}  0
    # Should Be Equal  ${cutleryFromList}  Cutlery

    ${customer_delivery_fee}=  Get Value From Json  ${resp.json()}  data[0].customer_delivery_fee
    ${deliveryfeeFromList}=  Get From List  ${customer_delivery_fee}  0
    Should Be Equal As Strings  ${deliveryfeeFromList}  ${df}

    ${total_amount}=  Get Value From Json  ${resp.json()}  data[0].total_amount
    ${amountFromList}=  Get From List  ${total_amount}  0
    Should Be Equal As Strings  ${amountFromList}  ${total}

    ${sub_total}=  Get Value From Json  ${resp.json()}  data[0].sub_total
    ${subtotalFromList}=  Get From List  ${sub_total}  0
    Should Be Equal As Strings  ${subtotalFromList}  ${subtotalprice}

    ${is_tax_receipt}=  Get Value From Json  ${resp.json()}  data[0].is_tax_receipt
    ${taxFromList}=  Get From List  ${is_tax_receipt}  0
    Should Be Equal As Strings  ${taxFromList}  False

    ${is_30mins_guarantee}=  Get Value From Json  ${resp.json()}  data[0].is_30mins_guarantee
    ${30minsFromList}=  Get From List  ${is_30mins_guarantee}  0
    Should Be Equal As Strings  ${30minsFromList}  True

16.Order created success
    &{headers}      Create Dictionary  Content-Type=application/json
    Create Session  URL  ${fleeturl}
    ${resp}=        GET On Session  URL  ${fleetpath}${masterorder}  headers=${headers}

    ${status}=  Get Value From Json  ${resp.json()}  data[0].status
    ${statusFromList}=  Get From List  ${status}  0
    Should Not Be Equal  ${statusFromList}  ORDER_CREATE_ERROR
