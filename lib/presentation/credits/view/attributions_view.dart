import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/more/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AttributionsView extends StatelessWidget {
  const AttributionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SettingsPageLayout(
      label: l10n.attributions,
      child: const MoreSection(
        children: [
          MoreSectionItemTextDescription(
            label: 'Krzysztof Dudzik-Górnicki',
            description:
                'CC BY-SA 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=7638431\nhttps://commons.wikimedia.org/w/index.php?curid=7638431',
          ),
          MoreSectionItemTextDescription(
            label: 'Opioła Jerzy',
            description: 'CC BY 2.5\nhttps://commons.wikimedia.org/w/index.php?curid=777955',
          ),
          MoreSectionItemTextDescription(
            label: 'Marcin Dąbrowski',
            description: 'CC BY-SA 2.5\nhttps://commons.wikimedia.org/w/index.php?curid=499774',
          ),
          MoreSectionItemTextDescription(
            label: 'Kotu',
            description: 'CC BY-SA 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=5700754',
          ),
          MoreSectionItemTextDescription(
            label: 'Jendrusk',
            description: 'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=130896757',
          ),
          MoreSectionItemTextDescription(
            label: 'Jerzy Opioła',
            description:
                'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=7212793\nhttps://commons.wikimedia.org/w/index.php?curid=3957391',
          ),
          MoreSectionItemTextDescription(
            label: 'Henryk Bielamowicz',
            description:
                'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=61056244\nCC BY 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=71641737',
          ),
          MoreSectionItemTextDescription(
            label: 'Timaska',
            description:
                'CC0\nhttps://commons.wikimedia.org/w/index.php?curid=47825881\nPublic Domain\nhttps://commons.wikimedia.org/w/index.php?curid=12112383\nhttps://commons.wikimedia.org/w/index.php?curid=12113383',
          ),
          MoreSectionItemTextDescription(
            label: 'Jaknowy',
            description: 'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=3695953',
          ),
          MoreSectionItemTextDescription(
            label: 'Mateusz Małkowski',
            description:
                'CC BY 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=146638845\nhttps://commons.wikimedia.org/w/index.php?curid=148523726',
          ),
          MoreSectionItemTextDescription(
            label: 'Jacek Halicki',
            description:
                'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=50077054\nhttps://commons.wikimedia.org/w/index.php?curid=50077054\nhttps://commons.wikimedia.org/w/index.php?curid=34774060\nCC BY-SA 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=40253666',
          ),
          MoreSectionItemTextDescription(
            label: 'Olidudlatdeysok',
            description: 'CC BY-SA 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=8687649',
          ),
          MoreSectionItemTextDescription(
            label: 'Julo',
            description: 'Public Domain\nhttps://commons.wikimedia.org/w/index.php?curid=951733',
          ),
          MoreSectionItemTextDescription(
            label: 'schwabacher',
            description: 'CC BY 2.5\nhttps://commons.wikimedia.org/w/index.php?curid=856138',
          ),
          MoreSectionItemTextDescription(
            label: 'Michał Płachta',
            description: 'CC BY-SA 2.5\nhttps://commons.wikimedia.org/w/index.php?curid=1147924',
          ),
          MoreSectionItemTextDescription(
            label: 'Chmee2',
            description: 'CC BY-SA 3.0\nhttps://commons.wikimedia.org/w/index.php?curid=33416647',
          ),
          MoreSectionItemTextDescription(
            label: 'The Last V8',
            description: 'CC BY-SA 2.0\nhttps://commons.wikimedia.org/w/index.php?curid=8637465',
          ),
          MoreSectionItemTextDescription(
            label: '-',
            description: 'CC BY-SA 2.5\nhttps://commons.wikimedia.org/w/index.php?curid=1042839',
          ),
          MoreSectionItemTextDescription(
            label: 'Lvkephotos',
            description: 'CC BY-SA 4.0\nhttps://commons.wikimedia.org/w/index.php?curid=150555227',
          ),
        ],
      ),
    );
  }
}
