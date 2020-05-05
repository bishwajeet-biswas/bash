#!/bin/bash

components="chatbot-testing-1a1noojtd4zpux8fntr3bhhlj6n-1
chatbot-testing-1a1wsvdkmnxgpmtzjwziejcrjns-1
chatbot-testing-1abysw1divulvbod9zfr3xslewh-1
chatbot-testing-1aels3rajbjlxseyrtap3clmzfj-1
chatbot-testing-1aeqemkakicopfu5dms3sapfm8v-1
chatbot-testing-1aeuxqiolot9cwu3oms9irwm9dt-24
chatbot-testing-1af04k7zeylxzvr9hh6xbpm4uzu-26
chatbot-testing-1af8ugh88yir0ccp0jnj2xkbvc2-1
chatbot-testing-1afittxu5hglhsnpnymqzr3qcwq-1
chatbot-testing-1afxprgvq2hpnu2ynbhsjctwo59-1
chatbot-testing-1anuvbmqtq4qolafmklbl1qyu96-1
chatbot-testing-1anvhq457l7y1fovwtnqxil7avr-1
chatbot-testing-1anvlabiclihc1doje5iefdbryf-1
chatbot-testing-1aqdkwuv1nub0x4wmqym8u9fc1l-1
chatbot-testing-1aqsfqjus0mpnaqjazs8udmuwfy-1
chatbot-testing-1aqswppmvwjaiocmtkuzir28sau-1
chatbot-testing-1avouhqxfhmtc1sidwamjctnx7t-1
chatbot-testing-1b1zi7quci70qpklutpuyxcxkxx-24
chatbot-testing-1b78e9mphsueodmgxfcgtvs6oqj-1
chatbot-testing-1bau6brtt1zzelqyflan2qbecoq-1
chatbot-testing-1bfqoba6yhlapjdsmlbxcvvhzwn-1
chatbot-testing-1bfrxcsrnwuosn0rt112zdtfaey-1
chatbot-testing-1bfzmvlzj6fmmwcnehbiccqicml-1
chatbot-testing-1bgkmqvpmgn6oawznwolghx14nz-1
chatbot-testing-1zkudy2amxmcy6v5x0pmpmihobd-1
chatbot-testing-401-1
chatbot-testing-402-1
chatbot-testing-404-1
chatbot-testing-409-44
chatbot-testing-411-64
chatbot-testing-66-31
chatbot-testing-67-31
chatbot-testing-69-29
chatbot-testing-71-29
chatbot-testing-72-29
chatbot-testing-73-32
chatbot-testing-74-32
chatbot-testing-75-33
chatbot-testing-80-31
chatbot-testing-81-31
chatbot-testing-83-35
chatbot-testing-86-24
chatbot-testing-94-26"


for i in $components
    do
   
        kubectl set image deploy $i middleware=gcr.io/kbbot-217410/multi-mdw:30bcf0bf7157d025c01d9e7dffc28bdc181d45e9 -n mqa 
        echo
    done

