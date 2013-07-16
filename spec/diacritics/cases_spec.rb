# encoding: utf-8
require 'spec_helper'

describe Diacritics::Cases do
  context "#downcase, #upcase, #permanent" do
    subject { Diacritics::Cases.instance }

    [
      { # English
        text: "Will will Will will Will's will to Will?",
        lower: "will will will will will's will to will?",
        upper: "WILL WILL WILL WILL WILL'S WILL TO WILL?",
        permanent: "will-will-will-will-will's-will-to-will"
      },
      { # German
        text: "Acht alte Ameisen aßen am Abend Ananas.",
        lower: "acht alte ameisen aßen am abend ananas.",
        upper: "ACHT ALTE AMEISEN AẞEN AM ABEND ANANAS.",
        permanent: "acht-alte-ameisen-assen-am-abend-ananas",
      },
      { # German
        text: "Hämmer Hämmer? Hämmer hämmer.",
        lower: "hämmer hämmer? hämmer hämmer.",
        upper: "HÄMMER HÄMMER? HÄMMER HÄMMER.",
        permanent: "haemmer-haemmer-haemmer-haemmer",
      },
      { # German
        text: "Fünf Ferkel fressen frisches Futter.",
        lower: "fünf ferkel fressen frisches futter.",
        upper: "FÜNF FERKEL FRESSEN FRISCHES FUTTER.",
        permanent: "fuenf-ferkel-fressen-frisches-futter",
      },
      {
        text: "Ödögidöggi",
        lower: "ödögidöggi",
        upper: "ÖDÖGIDÖGGI",
        permanent: "oedoegidoeggi",
      },
      { # Polish
        text: "Ćma ćmę ćmi.",
        lower: "ćma ćmę ćmi.",
        upper: "ĆMA ĆMĘ ĆMI.",
        permanent: "cma-cme-cmi",
      },
      { # Polish
        text: "Żubr żuł żuchwą żurawinę.",
        lower: "żubr żuł żuchwą żurawinę.",
        upper: "ŻUBR ŻUŁ ŻUCHWĄ ŻURAWINĘ.",
        permanent: "zubr-zul-zuchwa-zurawine",
      },
      { # Polish
        text: "Pchnąć w tę łódź jeża lub ośm skrzyń fig.",
        lower: "pchnąć w tę łódź jeża lub ośm skrzyń fig.",
        upper: "PCHNĄĆ W TĘ ŁÓDŹ JEŻA LUB OŚM SKRZYŃ FIG.",
        permanent: "pchnac-w-te-lodz-jeza-lub-osm-skrzyn-fig",
      },
      { # Czech
        text: "Čistý s Čistou čistili činčilový čepec.",
        lower: "čistý s čistou čistili činčilový čepec.",
        upper: "ČISTÝ S ČISTOU ČISTILI ČINČILOVÝ ČEPEC.",
        permanent: "cisty-s-cistou-cistili-cincilovy-cepec",
      },
      { # Czech
        text: "Řekni řeřicha.",
        lower: "řekni řeřicha.",
        upper: "ŘEKNI ŘEŘICHA.",
        permanent: "rekni-rericha",
      },
      { # Polish
        text: "Zażółć gęślą jaźń",
        lower: "zażółć gęślą jaźń",
        upper: "ZAŻÓŁĆ GĘŚLĄ JAŹŃ",
        permanent: "zazolc-gesla-jazn",
      },
      {
        text: "À l’époque de la conquête de la Gaule par les armées",
        lower: "à l’époque de la conquête de la gaule par les armées",
        upper: "À L’ÉPOQUE DE LA CONQUÊTE DE LA GAULE PAR LES ARMÉES",
        permanent: "a-l’epoque-de-la-conquete-de-la-gaule-par-les-armees",
      },
      {
        text: "Zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.",
        lower: "zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.",
        upper: "ZALYŽAŘIVŠÍ SI LYŽAŘ POTKAL NEZALYŽAŘIVŠÍHO SI LYŽAŘE.",
        permanent: "zalyzarivsi-si-lyzar-potkal-nezalyzarivsiho-si-lyzare",
      },
      {
        text: "Náš pan kaplan v kapli plakal.",
        lower: "náš pan kaplan v kapli plakal.",
        upper: "NÁŠ PAN KAPLAN V KAPLI PLAKAL.",
        permanent: "nas-pan-kaplan-v-kapli-plakal",
      },
      {
        text: "¿Quién lo desenladrillará?",
        lower: "¿quién lo desenladrillará?",
        upper: "¿QUIÉN LO DESENLADRILLARÁ?",
        permanent: "quien-lo-desenladrillara",
      },
      {
        text: "clavó un clavito Pablito.",
        lower: "clavó un clavito pablito.",
        upper: "CLAVÓ UN CLAVITO PABLITO.",
        permanent: "clavo-un-clavito-pablito",
      },
      {
        text: "In Perù però perì.",
        lower: "in perù però perì.",
        upper: "IN PERÙ PERÒ PERÌ.",
        permanent: "in-peru-pero-peri",
      },
      {
        text: "Ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?",
        lower: "ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?",
        upper: "ĈU ŜI ĈIAM ĈE ĈIO RUĜIĜAS?",
        permanent: "cu-si-ciam-ce-cio-rugigas",
      },
      {
        text: "Eĥoŝanĝo ĉiu-ĵaŭde.",
        lower: "eĥoŝanĝo ĉiu-ĵaŭde.",
        upper: "EĤOŜANĜO ĈIU-ĴAŬDE.",
        permanent: "ehosango-ciu-jaude",
      },
      {
        text: "Árni á Á á á á beit (við á).",
        lower: "árni á á á á á beit (við á).",
        upper: "ÁRNI Á Á Á Á Á BEIT (VIÐ Á).",
        permanent: "arni-a-a-a-a-a-beit-(vid-a)",
      },
      {
        text: "Það fer að verða verra ferðaveðrið",
        lower: "það fer að verða verra ferðaveðrið",
        upper: "ÞAÐ FER AÐ VERÐA VERRA FERÐAVEÐRIÐ",
        permanent: "pad-fer-ad-verda-verra-ferdavedrid",
      },
      {
        text: "Четыре чёрненьких чумазеньких чертёнка",
        lower: "четыре чёрненьких чумазеньких чертёнка",
        upper: "ЧЕТЫРЕ ЧЁРНЕНЬКИХ ЧУМАЗЕНЬКИХ ЧЕРТЁНКА",
        permanent: "четыре-чёрненьких-чумазеньких-чертёнка",
      },
      {
        text: "чертили чёрными чернилами чертёж.",
        lower: "чертили чёрными чернилами чертёж.",
        upper: "ЧЕРТИЛИ ЧЁРНЫМИ ЧЕРНИЛАМИ ЧЕРТЁЖ.",
        permanent: "чертили-чёрными-чернилами-чертёж",
      },
      {
        text: "Чайные чашки в печали, скучая, бренча закричали.",
        lower: "чайные чашки в печали, скучая, бренча закричали.",
        upper: "ЧАЙНЫЕ ЧАШКИ В ПЕЧАЛИ, СКУЧАЯ, БРЕНЧА ЗАКРИЧАЛИ.",
        permanent: "чайные-чашки-в-печали-скучая-бренча-закричали",
      },
      {
        text: "Недопереквалифицировавшийся.",
        lower: "недопереквалифицировавшийся.",
        upper: "НЕДОПЕРЕКВАЛИФИЦИРОВАВШИЙСЯ.",
        permanent: "недопереквалифицировавшийся",
      },
      {
        text: "Как в капюшоне он смешон",
        lower: "как в капюшоне он смешон",
        upper: "КАК В КАПЮШОНЕ ОН СМЕШОН",
        permanent: "как-в-капюшоне-он-смешон",
      },
      {
        text: "Стоит гора посреди двора.",
        lower: "стоит гора посреди двора.",
        upper: "СТОИТ ГОРА ПОСРЕДИ ДВОРА.",
        permanent: "стоит-гора-посреди-двора",
      },
      {
        text: "Μια τίγρη με τρία τιγράκια.",
        lower: "μια τίγρη με τρία τιγράκια.",
        upper: "ΜΙΑ ΤΊΓΡΗ ΜΕ ΤΡΊΑ ΤΙΓΡΆΚΙΑ.",
        permanent: "mia-tigre-me-tria-tigrakia",
      },
      {
        text: "Το ξίδι του Ξέρξη ξίδιασε",
        lower: "το ξίδι του ξέρξη ξίδιασε",
        upper: "ΤΟ ΞΊΔΙ ΤΟΥ ΞΈΡΞΗ ΞΊΔΙΑΣΕ",
        permanent: "to-xidi-toy-xerxe-xidiase",
      },
      {
        text: "Πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.",
        lower: "πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.",
        upper: "ΠΊΤΑ ΣΠΑΝΑΚΌΠΙΤΑ ΣΠΑΝΑΚΟΛΑΔΟΦΡΑΓΚΟΣΥΚΟΠΑΝΤΖΑΡΟΚΟΛΟΚΥΘΌΠΙΤΑ.",
        permanent:
        "pita-spanakopita-spanakoladophragkosykopantzarokolokythopita",
      },
      {
        text: "Κοράλι ψιλοκόραλο και ψιλοκοραλάκι.",
        lower: "κοράλι ψιλοκόραλο και ψιλοκοραλάκι.",
        upper: "ΚΟΡΆΛΙ ΨΙΛΟΚΌΡΑΛΟ ΚΑΙ ΨΙΛΟΚΟΡΑΛΆΚΙ.",
        permanent: "korali-psilokoralo-kai-psilokoralaki",
      },
      {
        text: "É muito socó para um socó só coçar.",
        lower: "é muito socó para um socó só coçar.",
        upper: "É MUITO SOCÓ PARA UM SOCÓ SÓ COÇAR.",
        permanent: "e-muito-soco-para-um-soco-so-cocar",
      },
      {
        text: "Mon père est maire, mon frère est masseur.",
        lower: "mon père est maire, mon frère est masseur.",
        upper: "MON PÈRE EST MAIRE, MON FRÈRE EST MASSEUR.",
        permanent: "mon-pere-est-maire-mon-frere-est-masseur",
      },
      {
        text: "Se não percebeste,",
        lower: "se não percebeste,",
        upper: "SE NÃO PERCEBESTE,",
        permanent: "se-nao-percebeste",
      },
      {
        text: "rôt tenta chat",
        lower: "rôt tenta chat",
        upper: "RÔT TENTA CHAT",
        permanent: "rot-tenta-chat",
      },
      {
        text: "Nyelvtörők",
        lower: "nyelvtörők",
        upper: "NYELVTÖRŐK",
        permanent: "nyelvtoeroek",
      },
      {
        text: "Ein hælv kælv låg i elva og flaut på ein sælapinne.",
        lower: "ein hælv kælv låg i elva og flaut på ein sælapinne.",
        upper: "EIN HÆLV KÆLV LÅG I ELVA OG FLAUT PÅ EIN SÆLAPINNE.",
        permanent: "ein-haelv-kaelv-lag-i-elva-og-flaut-pa-ein-saelapinne",
      },
      # {
      #  text: "",
      #  lower: "",
      #  upper: "",
      #  permanent: "",
      # },
    ].each do |item|
      text, lower, upper, permanent = item.values

      it "change '#{text}' to lowercase" do
        subject.downcase(text).should eq(lower)
      end

      it "change '#{text}' to uppercase" do
        subject.upcase(text).should eq(upper)
      end

      it "change '#{text}' to permanent" do
        subject.permanent(text).should eq(permanent)
      end
    end
  end
end
