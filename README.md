<img width="937" height="535" alt="Capture d&#39;écran 2026-11-18 172819" src="https://github.com/user-attachments/assets/8c6c3d9d-2171-41d0-9747-25d12587bba6" />
<img width="388" height="204" alt="Capture d&#39;écran 2026-11-18 172910" src="https://github.com/user-attachments/assets/5cfb9cc2-2cb2-4b07-a554-433a941d565a" />
<img width="923" height="539" alt="Capture d&#39;écran 2026-11-18 172919" src="https://github.com/user-attachments/assets/55cf47c0-2670-4a9b-9015-e469fbe71955" />
# Lab 3 : Interrogation et filtrage de données en SQL

Ce dépôt contient les solutions des exercices du **Lab 3** portant sur l'interrogation de la base de données `bibliotheque` (tri, limitation, filtrage sur les chaînes de caractères et gestion des dates).

## Fichiers du projet
* `lab3_exercices.sql` : Script SQL contenant les 4 requêtes demandées.
* Captures d'écran : Résultats de l'exécution du script via le terminal MySQL.

## Résumé des requêtes réalisées
1. **Tri et limitation (`ORDER BY` / `LIMIT`)** : Affichage des 3 derniers ouvrages ajoutés dans la base.
2. **Filtrage sur les chaînes (`CHAR_LENGTH`)** : Sélection des auteurs dont le nom comporte au moins 5 caractères.
3. **Filtrage négatif (`NOT LIKE`)** : Extraction des abonnés dont l'adresse e-mail n'appartient ni à `@example.com` ni à `@test.org`.
4. **Gestion des dates (`CURDATE()` / `IS NULL`)** : Identification des emprunts en retard dont la date de fin est dépassée et qui n'ont pas encore été retournés.

## Preuves d'exécution (Screenshots)
Les captures d'écran ci-jointes montrent la bonne exécution du fichier `lab3_exercices.sql` dans le terminal MySQL via la commande `SOURCE` ainsi que l'affichage des résultats de chaque requête.
