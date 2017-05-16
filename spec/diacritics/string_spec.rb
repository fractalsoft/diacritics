# encoding: utf-8
require 'spec_helper'

describe Diacritics::String do
  String.send(:include, Diacritics::String)

  shared_examples_for 'word processing' do
    describe '#downcase' do
      it { expect(subject.downcase).to eq result[0] }
    end

    describe '#upcase' do
      it { expect(subject.upcase).to eq result[1] }
    end

    describe '#permanent' do
      it { expect(subject.permanent).to eq result[2] }
    end

    describe '#pernament?' do
      let(:permanent) { subject.permanent }
      it { expect(subject).not_to be_permanent }
      it { expect(permanent).to be_permanent }
    end
  end

  context 'English' do
    it_behaves_like 'word processing' do
      subject { "Will will Will will Will's will to Will?" }
      let(:result) do
        [
          "will will will will will's will to will?",
          "WILL WILL WILL WILL WILL'S WILL TO WILL?",
          "will-will-will-will-will's-will-to-will"
        ]
      end
    end
  end

  context 'German' do
    it_behaves_like 'word processing' do
      subject { 'Acht alte Ameisen aßen am Abend Ananas.' }
      let(:result) do
        [
          'acht alte ameisen aßen am abend ananas.',
          'ACHT ALTE AMEISEN AẞEN AM ABEND ANANAS.',
          'acht-alte-ameisen-assen-am-abend-ananas'
        ]
      end
    end
  end

  context 'German' do
    it_behaves_like 'word processing' do
      subject { 'Hämmer Hämmer? Hämmer hämmer.' }
      let(:result) do
        [
          'hämmer hämmer? hämmer hämmer.',
          'HÄMMER HÄMMER? HÄMMER HÄMMER.',
          'haemmer-haemmer-haemmer-haemmer'
        ]
      end
    end
  end

  context 'German' do
    it_behaves_like 'word processing' do
      subject { 'Fünf Ferkel fressen frisches Futter.' }
      let(:result) do
        [
          'fünf ferkel fressen frisches futter.',
          'FÜNF FERKEL FRESSEN FRISCHES FUTTER.',
          'fuenf-ferkel-fressen-frisches-futter'
        ]
      end
    end
  end

  context 'German' do
    it_behaves_like 'word processing' do
      subject { 'Ödögidöggi' }
      let(:result) do
        %w(
          ödögidöggi
          ÖDÖGIDÖGGI
          oedoegidoeggi
        )
      end
    end
  end

  context 'Polish' do
    it_behaves_like 'word processing' do
      subject { 'Ćma ćmę ćmi.' }
      let(:result) do
        [
          'ćma ćmę ćmi.',
          'ĆMA ĆMĘ ĆMI.',
          'cma-cme-cmi'
        ]
      end
    end
  end

  context 'Polish' do
    it_behaves_like 'word processing' do
      subject { 'Żubr żuł żuchwą żurawinę.' }
      let(:result) do
        [
          'żubr żuł żuchwą żurawinę.',
          'ŻUBR ŻUŁ ŻUCHWĄ ŻURAWINĘ.',
          'zubr-zul-zuchwa-zurawine'
        ]
      end
    end
  end

  context 'Polish' do
    it_behaves_like 'word processing' do
      subject { 'Pchnąć w tę łódź jeża lub ośm skrzyń fig.' }
      let(:result) do
        [
          'pchnąć w tę łódź jeża lub ośm skrzyń fig.',
          'PCHNĄĆ W TĘ ŁÓDŹ JEŻA LUB OŚM SKRZYŃ FIG.',
          'pchnac-w-te-lodz-jeza-lub-osm-skrzyn-fig'
        ]
      end
    end
  end

  context 'Czech' do
    it_behaves_like 'word processing' do
      subject { 'Čistý s Čistou čistili činčilový čepec.' }
      let(:result) do
        [
          'čistý s čistou čistili činčilový čepec.',
          'ČISTÝ S ČISTOU ČISTILI ČINČILOVÝ ČEPEC.',
          'cisty-s-cistou-cistili-cincilovy-cepec'
        ]
      end
    end
  end

  context 'Czech' do
    it_behaves_like 'word processing' do
      subject { 'Řekni řeřicha.' }
      let(:result) do
        [
          'řekni řeřicha.',
          'ŘEKNI ŘEŘICHA.',
          'rekni-rericha'
        ]
      end
    end
  end

  context 'Polish' do
    it_behaves_like 'word processing' do
      subject { 'Zażółć gęślą jaźń' }
      let(:result) do
        [
          'zażółć gęślą jaźń',
          'ZAŻÓŁĆ GĘŚLĄ JAŹŃ',
          'zazolc-gesla-jazn'
        ]
      end
    end
  end

  context 'Spanish' do
    it_behaves_like 'word processing' do
      subject { 'Whisky bueno: ¡excitad mi frágil pequeña vejez!' }
      let(:result) do
        [
          'whisky bueno: ¡excitad mi frágil pequeña vejez!',
          'WHISKY BUENO: ¡EXCITAD MI FRÁGIL PEQUEÑA VEJEZ!',
          'whisky-bueno-excitad-mi-fragil-pequena-vejez'
        ]
      end
    end
  end

  context 'Portugués' do
    it_behaves_like 'word processing' do
      subject { 'Luís argüia à Júlia que «brações, fé, chá, óxido, pôr, zângão» eram palavras do português.' }
      let(:result) do
        [
          'luís argüia à júlia que «brações, fé, chá, óxido, pôr, zângão» eram palavras do português.',
          'LUÍS ARGÜIA À JÚLIA QUE «BRAÇÕES, FÉ, CHÁ, ÓXIDO, PÔR, ZÂNGÃO» ERAM PALAVRAS DO PORTUGUÊS.',
          'luis-argueia-a-julia-que-bracoes-fe-cha-oxido-por-zangao-eram-palavras-do-portugues'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'À l’époque de la conquête de la Gaule par les armées' }
      let(:result) do
        [
          'à l’époque de la conquête de la gaule par les armées',
          'À L’ÉPOQUE DE LA CONQUÊTE DE LA GAULE PAR LES ARMÉES',
          'a-l’epoque-de-la-conquete-de-la-gaule-par-les-armees'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.' }
      let(:result) do
        [
          'zalyžařivší si lyžař potkal nezalyžařivšího si lyžaře.',
          'ZALYŽAŘIVŠÍ SI LYŽAŘ POTKAL NEZALYŽAŘIVŠÍHO SI LYŽAŘE.',
          'zalyzarivsi-si-lyzar-potkal-nezalyzarivsiho-si-lyzare'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Náš pan kaplan v kapli plakal.' }
      let(:result) do
        [
          'náš pan kaplan v kapli plakal.',
          'NÁŠ PAN KAPLAN V KAPLI PLAKAL.',
          'nas-pan-kaplan-v-kapli-plakal'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { '¿Quién lo desenladrillará?' }
      let(:result) do
        [
          '¿quién lo desenladrillará?',
          '¿QUIÉN LO DESENLADRILLARÁ?',
          'quien-lo-desenladrillara'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'clavó un clavito Pablito.' }
      let(:result) do
        [
          'clavó un clavito pablito.',
          'CLAVÓ UN CLAVITO PABLITO.',
          'clavo-un-clavito-pablito'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'In Perù però perì.' }
      let(:result) do
        [
          'in perù però perì.',
          'IN PERÙ PERÒ PERÌ.',
          'in-peru-pero-peri'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?' }
      let(:result) do
        [
          'ĉu ŝi ĉiam ĉe ĉio ruĝiĝas?',
          'ĈU ŜI ĈIAM ĈE ĈIO RUĜIĜAS?',
          'cu-si-ciam-ce-cio-rugigas'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Eĥoŝanĝo ĉiu-ĵaŭde.' }
      let(:result) do
        [
          'eĥoŝanĝo ĉiu-ĵaŭde.',
          'EĤOŜANĜO ĈIU-ĴAŬDE.',
          'ehosango-ciu-jaude'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Árni á Á á á á beit (við á).' }
      let(:result) do
        [
          'árni á á á á á beit (við á).',
          'ÁRNI Á Á Á Á Á BEIT (VIÐ Á).',
          'arni-a-a-a-a-a-beit-(vid-a)'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Það fer að verða verra ferðaveðrið' }
      let(:result) do
        [
          'það fer að verða verra ferðaveðrið',
          'ÞAÐ FER AÐ VERÐA VERRA FERÐAVEÐRIÐ',
          'pad-fer-ad-verda-verra-ferdavedrid'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Четыре чёрненьких чумазеньких чертёнка' }
      let(:result) do
        [
          'четыре чёрненьких чумазеньких чертёнка',
          'ЧЕТЫРЕ ЧЁРНЕНЬКИХ ЧУМАЗЕНЬКИХ ЧЕРТЁНКА',
          'четыре-чёрненьких-чумазеньких-чертёнка'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'чертили чёрными чернилами чертёж.' }
      let(:result) do
        [
          'чертили чёрными чернилами чертёж.',
          'ЧЕРТИЛИ ЧЁРНЫМИ ЧЕРНИЛАМИ ЧЕРТЁЖ.',
          'чертили-чёрными-чернилами-чертёж'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Чайные чашки в печали, скучая, бренча закричали.' }
      let(:result) do
        [
          'чайные чашки в печали, скучая, бренча закричали.',
          'ЧАЙНЫЕ ЧАШКИ В ПЕЧАЛИ, СКУЧАЯ, БРЕНЧА ЗАКРИЧАЛИ.',
          'чайные-чашки-в-печали-скучая-бренча-закричали'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Недопереквалифицировавшийся.' }
      let(:result) do
        [
          'недопереквалифицировавшийся.',
          'НЕДОПЕРЕКВАЛИФИЦИРОВАВШИЙСЯ.',
          'недопереквалифицировавшийся'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Как в капюшоне он смешон' }
      let(:result) do
        [
          'как в капюшоне он смешон',
          'КАК В КАПЮШОНЕ ОН СМЕШОН',
          'как-в-капюшоне-он-смешон'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Стоит гора посреди двора.' }
      let(:result) do
        [
          'стоит гора посреди двора.',
          'СТОИТ ГОРА ПОСРЕДИ ДВОРА.',
          'стоит-гора-посреди-двора'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Μια τίγρη με τρία τιγράκια.' }
      let(:result) do
        [
          'μια τίγρη με τρία τιγράκια.',
          'ΜΙΑ ΤΊΓΡΗ ΜΕ ΤΡΊΑ ΤΙΓΡΆΚΙΑ.',
          'mia-tigre-me-tria-tigrakia'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Το ξίδι του Ξέρξη ξίδιασε' }
      let(:result) do
        [
          'το ξίδι του ξέρξη ξίδιασε',
          'ΤΟ ΞΊΔΙ ΤΟΥ ΞΈΡΞΗ ΞΊΔΙΑΣΕ',
          'to-xidi-toy-xerxe-xidiase'
        ]
      end
    end
  end

  it_behaves_like 'word processing' do
    subject { 'Πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.' }
    let(:result) do
      [
        'πίτα σπανακόπιτα σπανακολαδοφραγκοσυκοπαντζαροκολοκυθόπιτα.',
        'ΠΊΤΑ ΣΠΑΝΑΚΌΠΙΤΑ ΣΠΑΝΑΚΟΛΑΔΟΦΡΑΓΚΟΣΥΚΟΠΑΝΤΖΑΡΟΚΟΛΟΚΥΘΌΠΙΤΑ.',
        'pita-spanakopita-spanakoladophragkosykopantzarokolokythopita'
      ]
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Κοράλι ψιλοκόραλο και ψιλοκοραλάκι.' }
      let(:result) do
        [
          'κοράλι ψιλοκόραλο και ψιλοκοραλάκι.',
          'ΚΟΡΆΛΙ ΨΙΛΟΚΌΡΑΛΟ ΚΑΙ ΨΙΛΟΚΟΡΑΛΆΚΙ.',
          'korali-psilokoralo-kai-psilokoralaki'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'É muito socó para um socó só coçar.' }
      let(:result) do
        [
          'é muito socó para um socó só coçar.',
          'É MUITO SOCÓ PARA UM SOCÓ SÓ COÇAR.',
          'e-muito-soco-para-um-soco-so-cocar'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Mon père est maire, mon frère est masseur.' }
      let(:result) do
        [
          'mon père est maire, mon frère est masseur.',
          'MON PÈRE EST MAIRE, MON FRÈRE EST MASSEUR.',
          'mon-pere-est-maire-mon-frere-est-masseur'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Se não percebeste,' }
      let(:result) do
        [
          'se não percebeste,',
          'SE NÃO PERCEBESTE,',
          'se-nao-percebeste'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'rôt tenta chat' }
      let(:result) do
        [
          'rôt tenta chat',
          'RÔT TENTA CHAT',
          'rot-tenta-chat'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Nyelvtörők' }
      let(:result) do
        %w(
          nyelvtörők
          NYELVTÖRŐK
          nyelvtoeroek
        )
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Ein hælv kælv låg i elva og flaut på ein sælapinne.' }
      let(:result) do
        [
          'ein hælv kælv låg i elva og flaut på ein sælapinne.',
          'EIN HÆLV KÆLV LÅG I ELVA OG FLAUT PÅ EIN SÆLAPINNE.',
          'ein-haelv-kaelv-lag-i-elva-og-flaut-pa-ein-saelapinne'
        ]
      end
    end
  end

  context do
    it_behaves_like 'word processing' do
      subject { 'Dès Noël où un zéphyr haï me vêt de glaçons würmiens je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
      let(:result) do
        [
          'dès noël où un zéphyr haï me vêt de glaçons würmiens je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !',
          'DÈS NOËL OÙ UN ZÉPHYR HAÏ ME VÊT DE GLAÇONS WÜRMIENS JE DÎNE D’EXQUIS RÔTIS DE BŒUF AU KIR À L’AŸ D’ÂGE MÛR & CÆTERA !',
          'des-noel-ou-un-zephyr-hai-me-vet-de-glacons-wuermiens-je-dine-d’exquis-rotis-de-boeuf-au-kir-a-l’ay-d’age-mur-&-caetera-'
        ]
      end
    end
  end

  context do
    it { expect('lorem-ipsum').to be_slug }
    it { expect('lorem_ipsum').to be_slug }
    it { expect('lorem0ipsum').to be_slug }
    it { expect('lorem!ipsum').not_to be_slug }
    it { expect('lorem#ipsum').not_to be_slug }
    it { expect('lorem$ipsum').not_to be_slug }
    it { expect('lorem&ipsum').not_to be_slug }
    it { expect("lorem'ipsum").not_to be_slug }
    it { expect('lorem(ipsum').not_to be_slug }
    it { expect('lorem)ipsum').not_to be_slug }
    it { expect('lorem+ipsum').not_to be_slug }
    it { expect('lorem,ipsum').not_to be_slug }
    it { expect('lorem/ipsum').not_to be_slug }
    it { expect('lorem:ipsum').not_to be_slug }
    it { expect('lorem;ipsum').not_to be_slug }
    it { expect('lorem?ipsum').not_to be_slug }
    it { expect('lorem@ipsum').not_to be_slug }
    it { expect('lorem[ipsum').not_to be_slug }
    it { expect('lorem]ipsum').not_to be_slug }
    it { expect('lorem{ipsum').not_to be_slug }
    it { expect('lorem}ipsum').not_to be_slug }
    it { expect('Lorem-ipsum').not_to be_slug }
    it { expect('łorem-ipsum').not_to be_slug }
  end
end
