# encoding: utf-8
require 'spec_helper'

describe Diacritics::String do
  String.send(:include, Diacritics::String)

  context 'English' do
    subject { "Will will Will will Will's will to Will?" }
    its(:downcase) { should eq "will will will will will's will to will?" }
    its(:upcase) { should eq "WILL WILL WILL WILL WILL'S WILL TO WILL?" }
    its(:permanent) { should eq "will-will-will-will-will's-will-to-will" }
  end

  context 'German' do
    subject { 'Acht alte Ameisen aßen am Abend Ananas.' }
    its(:downcase) { should eq 'acht alte ameisen aßen am abend ananas.' }
    its(:upcase) { should eq 'ACHT ALTE AMEISEN AẞEN AM ABEND ANANAS.' }
    its(:permanent) { should eq 'acht-alte-ameisen-assen-am-abend-ananas' }
  end

  context 'German' do
    subject { 'Hämmer Hämmer? Hämmer hämmer.' }
    its(:downcase) { should eq 'hämmer hämmer? hämmer hämmer.' }
    its(:upcase) { should eq 'HÄMMER HÄMMER? HÄMMER HÄMMER.' }
    its(:permanent) { should eq 'haemmer-haemmer-haemmer-haemmer' }
  end

  context 'German' do
    subject { 'Fünf Ferkel fressen frisches Futter.' }
    its(:downcase) { should eq 'fünf ferkel fressen frisches futter.' }
    its(:upcase) { should eq 'FÜNF FERKEL FRESSEN FRISCHES FUTTER.' }
    its(:permanent) { should eq 'fuenf-ferkel-fressen-frisches-futter' }
  end

  context 'German' do
    subject { 'Ödögidöggi' }
    its(:downcase) { should eq 'ödögidöggi' }
    its(:upcase) { should eq 'ÖDÖGIDÖGGI' }
    its(:permanent) { should eq 'oedoegidoeggi' }
  end

  context 'Polish' do
    subject { 'Ćma ćmę ćmi.' }
    its(:downcase) { should eq 'ćma ćmę ćmi.' }
    its(:upcase) { should eq 'ĆMA ĆMĘ ĆMI.' }
    its(:permanent) { should eq 'cma-cme-cmi' }
  end

  context 'Polish' do
    subject { 'Żubr żuł żuchwą żurawinę.' }
    its(:downcase) { should eq 'żubr żuł żuchwą żurawinę.' }
    its(:upcase) { should eq 'ŻUBR ŻUŁ ŻUCHWĄ ŻURAWINĘ.' }
    its(:permanent) { should eq 'zubr-zul-zuchwa-zurawine' }
  end

  context 'Polish' do
    subject { 'Pchnąć w tę łódź jeża lub ośm skrzyń fig.' }
    its(:downcase) { should eq 'pchnąć w tę łódź jeża lub ośm skrzyń fig.' }
    its(:upcase) { should eq 'PCHNĄĆ W TĘ ŁÓDŹ JEŻA LUB OŚM SKRZYŃ FIG.' }
    its(:permanent) { should eq 'pchnac-w-te-lodz-jeza-lub-osm-skrzyn-fig' }
  end

  context 'Czech' do
    subject { 'Čistý s Čistou čistili činčilový čepec.' }
    its(:downcase) { should eq 'čistý s čistou čistili činčilový čepec.' }
    its(:upcase) { should eq 'ČISTÝ S ČISTOU ČISTILI ČINČILOVÝ ČEPEC.' }
    its(:permanent) { should eq 'cisty-s-cistou-cistili-cincilovy-cepec' }
  end

  context 'Czech' do
    subject { 'Řekni řeřicha.' }
    its(:downcase) { should eq 'řekni řeřicha.' }
    its(:upcase) { should eq 'ŘEKNI ŘEŘICHA.' }
    its(:permanent) { should eq 'rekni-rericha' }
  end

  context 'Polish' do
    subject { 'Zażółć gęślą jaźń' }
    its(:downcase) { should eq 'zażółć gęślą jaźń' }
    its(:upcase) { should eq 'ZAŻÓŁĆ GĘŚLĄ JAŹŃ' }
    its(:permanent) { should eq 'zazolc-gesla-jazn' }
  end

  context do
    subject { 'À l’époque de la conquête de la Gaule par les armées' }
    its(:downcase) do
      should eq 'à l’époque de la conquête de la gaule par les armées'
    end
    its(:upcase) do
      should eq 'À L’ÉPOQUE DE LA CONQUÊTE DE LA GAULE PAR LES ARMÉES'
    end
    its(:permanent) do
      should eq 'a-l’epoque-de-la-conquete-de-la-gaule-par-les-armees'
    end
  end

  context do
    subject { 'Zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.' }
    its(:downcase) do
      should eq 'zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.'
    end
    its(:upcase) do
      should eq 'ZALYŽAŘIVŠÍ SI LYŽAŘ POTKAL NEZALYŽAŘIVŠÍHO SI LYŽAŘE.'
    end
    its(:permanent) do
      should eq 'zalyzarivsi-si-lyzar-potkal-nezalyzarivsiho-si-lyzare'
    end
  end

  context do
    subject { 'Náš pan kaplan v kapli plakal.' }
    its(:downcase) { should eq 'náš pan kaplan v kapli plakal.' }
    its(:upcase) { should eq 'NÁŠ PAN KAPLAN V KAPLI PLAKAL.' }
    its(:permanent) { should eq 'nas-pan-kaplan-v-kapli-plakal' }
  end

  context do
    subject { '¿Quién lo desenladrillará?' }
    its(:downcase) { should eq '¿quién lo desenladrillará?' }
    its(:upcase) { should eq '¿QUIÉN LO DESENLADRILLARÁ?' }
    its(:permanent) { should eq 'quien-lo-desenladrillara' }
  end

  context do
    subject { 'clavó un clavito Pablito.' }
    its(:downcase) { should eq 'clavó un clavito pablito.' }
    its(:upcase) { should eq 'CLAVÓ UN CLAVITO PABLITO.' }
    its(:permanent) { should eq 'clavo-un-clavito-pablito' }
  end

  context do
    subject { 'In Perù però perì.' }
    its(:downcase) { should eq 'in perù però perì.' }
    its(:upcase) { should eq 'IN PERÙ PERÒ PERÌ.' }
    its(:permanent) { should eq 'in-peru-pero-peri' }
  end

  context do
    subject { 'Ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?' }
    its(:downcase) { should eq 'ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?' }
    its(:upcase) { should eq 'ĈU ŜI ĈIAM ĈE ĈIO RUĜIĜAS?' }
    its(:permanent) { should eq 'cu-si-ciam-ce-cio-rugigas' }
  end

  context do
    subject { 'Eĥoŝanĝo ĉiu-ĵaŭde.' }
    its(:downcase) { should eq 'eĥoŝanĝo ĉiu-ĵaŭde.' }
    its(:upcase) { should eq 'EĤOŜANĜO ĈIU-ĴAŬDE.' }
    its(:permanent) { should eq 'ehosango-ciu-jaude' }
  end

  context do
    subject { 'Árni á Á á á á beit (við á).' }
    its(:downcase) { should eq 'árni á á á á á beit (við á).' }
    its(:upcase) { should eq 'ÁRNI Á Á Á Á Á BEIT (VIÐ Á).' }
    its(:permanent) { should eq 'arni-a-a-a-a-a-beit-(vid-a)' }
  end

  context do
    subject { 'Það fer að verða verra ferðaveðrið' }
    its(:downcase) { should eq 'það fer að verða verra ferðaveðrið' }
    its(:upcase) { should eq 'ÞAÐ FER AÐ VERÐA VERRA FERÐAVEÐRIÐ' }
    its(:permanent) { should eq 'pad-fer-ad-verda-verra-ferdavedrid' }
  end

  context do
    subject { 'Четыре чёрненьких чумазеньких чертёнка' }
    its(:downcase) { should eq 'четыре чёрненьких чумазеньких чертёнка' }
    its(:upcase) { should eq 'ЧЕТЫРЕ ЧЁРНЕНЬКИХ ЧУМАЗЕНЬКИХ ЧЕРТЁНКА' }
    its(:permanent) { should eq 'четыре-чёрненьких-чумазеньких-чертёнка' }
  end

  context do
    subject { 'чертили чёрными чернилами чертёж.' }
    its(:downcase) { should eq 'чертили чёрными чернилами чертёж.' }
    its(:upcase) { should eq 'ЧЕРТИЛИ ЧЁРНЫМИ ЧЕРНИЛАМИ ЧЕРТЁЖ.' }
    its(:permanent) { should eq 'чертили-чёрными-чернилами-чертёж' }
  end

  context do
    subject { 'Чайные чашки в печали, скучая, бренча закричали.' }
    its(:downcase) do
      should eq 'чайные чашки в печали, скучая, бренча закричали.'
    end
    its(:upcase) do
      should eq 'ЧАЙНЫЕ ЧАШКИ В ПЕЧАЛИ, СКУЧАЯ, БРЕНЧА ЗАКРИЧАЛИ.'
    end
    its(:permanent) do
      should eq 'чайные-чашки-в-печали-скучая-бренча-закричали'
    end
  end

  context do
    subject { 'Недопереквалифицировавшийся.' }
    its(:downcase) { should eq 'недопереквалифицировавшийся.' }
    its(:upcase) { should eq 'НЕДОПЕРЕКВАЛИФИЦИРОВАВШИЙСЯ.' }
    its(:permanent) { should eq 'недопереквалифицировавшийся' }
  end

  context do
    subject { 'Как в капюшоне он смешон' }
    its(:downcase) { should eq 'как в капюшоне он смешон' }
    its(:upcase) { should eq 'КАК В КАПЮШОНЕ ОН СМЕШОН' }
    its(:permanent) { should eq 'как-в-капюшоне-он-смешон' }
  end

  context do
    subject { 'Стоит гора посреди двора.' }
    its(:downcase) { should eq 'стоит гора посреди двора.' }
    its(:upcase) { should eq 'СТОИТ ГОРА ПОСРЕДИ ДВОРА.' }
    its(:permanent) { should eq 'стоит-гора-посреди-двора' }
  end

  context do
    subject { 'Μια τίγρη με τρία τιγράκια.' }
    its(:downcase) { should eq 'μια τίγρη με τρία τιγράκια.' }
    its(:upcase) { should eq 'ΜΙΑ ΤΊΓΡΗ ΜΕ ΤΡΊΑ ΤΙΓΡΆΚΙΑ.' }
    its(:permanent) { should eq 'mia-tigre-me-tria-tigrakia' }
  end

  context do
    subject { 'Μια τίγρη με τρία τιγράκια.' }
    its(:downcase) { should eq 'μια τίγρη με τρία τιγράκια.' }
    its(:upcase) { should eq 'ΜΙΑ ΤΊΓΡΗ ΜΕ ΤΡΊΑ ΤΙΓΡΆΚΙΑ.' }
    its(:permanent) { should eq 'mia-tigre-me-tria-tigrakia' }
  end

  context do
    subject { 'Το ξίδι του Ξέρξη ξίδιασε' }
    its(:downcase) { should eq 'το ξίδι του ξέρξη ξίδιασε' }
    its(:upcase) { should eq 'ΤΟ ΞΊΔΙ ΤΟΥ ΞΈΡΞΗ ΞΊΔΙΑΣΕ' }
    its(:permanent) { should eq 'to-xidi-toy-xerxe-xidiase' }
  end

  context do
    subject { 'Πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.' }
    its(:downcase) do
      should eq 'πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.'
    end
    its(:upcase) do
      should eq 'ΠΊΤΑ ΣΠΑΝΑΚΌΠΙΤΑ ΣΠΑΝΑΚΟΛΑΔΟΦΡΑΓΚΟΣΥΚΟΠΑΝΤΖΑΡΟΚΟΛΟΚΥΘΌΠΙΤΑ.'
    end
    its(:permanent) do
      should eq 'pita-spanakopita-spanakoladophragkosykopantzarokolokythopita'
    end
  end

  context do
    subject { 'Κοράλι ψιλοκόραλο και ψιλοκοραλάκι.' }
    its(:downcase) { should eq 'κοράλι ψιλοκόραλο και ψιλοκοραλάκι.' }
    its(:upcase) { should eq 'ΚΟΡΆΛΙ ΨΙΛΟΚΌΡΑΛΟ ΚΑΙ ΨΙΛΟΚΟΡΑΛΆΚΙ.' }
    its(:permanent) { should eq 'korali-psilokoralo-kai-psilokoralaki' }
  end

  context do
    subject { 'É muito socó para um socó só coçar.' }
    its(:downcase) { should eq 'é muito socó para um socó só coçar.' }
    its(:upcase) { should eq 'É MUITO SOCÓ PARA UM SOCÓ SÓ COÇAR.' }
    its(:permanent) { should eq 'e-muito-soco-para-um-soco-so-cocar' }
  end

  context do
    subject { 'Mon père est maire, mon frère est masseur.' }
    its(:downcase) { should eq 'mon père est maire, mon frère est masseur.' }
    its(:upcase) { should eq 'MON PÈRE EST MAIRE, MON FRÈRE EST MASSEUR.' }
    its(:permanent) { should eq 'mon-pere-est-maire-mon-frere-est-masseur' }
  end

  context do
    subject { 'Se não percebeste,' }
    its(:downcase) { should eq 'se não percebeste,' }
    its(:upcase) { should eq 'SE NÃO PERCEBESTE,' }
    its(:permanent) { should eq 'se-nao-percebeste' }
  end

  context do
    subject { 'rôt tenta chat' }
    its(:downcase) { should eq 'rôt tenta chat' }
    its(:upcase) { should eq 'RÔT TENTA CHAT' }
    its(:permanent) { should eq 'rot-tenta-chat' }
  end

  context do
    subject { 'Nyelvtörők' }
    its(:downcase) { should eq 'nyelvtörők' }
    its(:upcase) { should eq 'NYELVTÖRŐK' }
    its(:permanent) { should eq 'nyelvtoeroek' }
  end

  context do
    subject { 'Ein hælv kælv låg i elva og flaut på ein sælapinne.' }
    its(:downcase) do
      should eq 'ein hælv kælv låg i elva og flaut på ein sælapinne.'
    end
    its(:upcase) do
      should eq 'EIN HÆLV KÆLV LÅG I ELVA OG FLAUT PÅ EIN SÆLAPINNE.'
    end
    its(:permanent) do
      should eq 'ein-haelv-kaelv-lag-i-elva-og-flaut-pa-ein-saelapinne'
    end
  end
end
