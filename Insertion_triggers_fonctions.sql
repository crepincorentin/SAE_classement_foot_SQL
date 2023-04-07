------------------------------------- SCRIPT DE CREATION DES TRIGGERS ET DES FONCTIONS -------------------------------------

-- Auteurs : CREPIN Corentin, MALEBE Mayel

-- TP : TPD

-- SAE BDD BUT2 SEMESTRE 3

-- Module : R3.07

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------- TRIGGERS -------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met à jour le classement buteur */

create or replace function augmente_nb_buts() returns trigger as $$
declare
  vjoueur int;
  vbut int;
  vnom varchar(50);
begin 
    select J.id_joueur, B.id_but, J.nom_joueur into vjoueur, vbut, vnom from joueur as J inner join but as B on J.id_joueur = B.id_joueur where id_but = new.id_but;
    if exists (select * from classement_buteur where id_classement_buteur = vjoueur) then
        update classement_buteur set but_marque = but_marque + 1 where id_classement_buteur = vjoueur;
    else
        insert into classement_buteur values (vjoueur, vnom, 1);
    end if;
    return new;
end;
$$ language plpgsql;

create trigger augmente_nb_buts
after insert on but
for each row execute procedure augmente_nb_buts();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui permet de refuser l'insertion d'un match si la date du match dépasse le  30/06/2020 */

CREATE OR REPLACE FUNCTION trigger_date_match() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.date_match > '2020-06-30' THEN
        RAISE EXCEPTION 'La date du match ne peut pas être supérieure au 30/06/2020';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_date_match
BEFORE INSERT ON match
FOR EACH ROW
EXECUTE PROCEDURE trigger_date_match();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui permet de refuser l'insertion d'un match si l'une des équipes a déjà un match à cette date */

CREATE OR REPLACE FUNCTION trigger_equipe_match() RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT * FROM match WHERE date_match = NEW.date_match AND (match.id_equipe_domicile = NEW.id_equipe_domicile OR match.id_equipe_exterieur = NEW.id_equipe_exterieur)) THEN
        RAISE EXCEPTION 'Une des équipes a déjà un match à cette date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_equipe_match
BEFORE INSERT ON match
FOR EACH ROW
EXECUTE PROCEDURE trigger_equipe_match();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui permet de refuser l'insertion d'un match si l'équipe à domicile est identique à l'équipe extérieure */

CREATE OR REPLACE function trigger_equipedomext_match() RETURNS trigger AS $$
BEGIN
    IF NEW.id_equipe_domicile = NEW.id_equipe_exterieur THEN
        RAISE EXCEPTION 'L''équipe à domicile ne peut pas être identique à l''équipe extérieure';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_equipedomext_match
BEFORE INSERT OR UPDATE ON match
FOR EACH ROW
EXECUTE PROCEDURE trigger_equipedomext_match();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui limite le nombre d'insertion dans la table but en fonction du nombre de buts marqués dans un match */

create or replace function limit_insertion_but() returns trigger as $$
declare
  vmatch int;
  vbut int;
  vvbut int;
begin 
    select id_match into vmatch from match as M where id_match = new.id_match;
    select count(*) into vbut from but where id_match = vmatch;
    select score_equipe_domicile + score_equipe_exterieur into vvbut from match where id_match = vmatch;
    if vbut >= vvbut then
        raise exception 'Vous avez déja inséré le nombre de buts maximum pour ce match (% buts)', vvbut;  
    end if;
    return new;
end;
$$ language plpgsql;

create trigger limit_insertion_but
before insert on but
for each row
execute procedure limit_insertion_but();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui permet de mettre à jour le nombre de points de chaque équipe à chaque fois qu'on insère un match dans la table match. */

Create or replace function nb_points() returns trigger as $$
declare
  id_equipe1 int;
  id_equipe2 int;
  but_marque1 int;
  but_marque2 int;
  points1 int;
  points2 int;
begin
    select id_equipe_domicile, id_equipe_exterieur, score_equipe_domicile, score_equipe_exterieur into id_equipe1, id_equipe2, but_marque1, but_marque2 from match where id_match = new.id_match;
    if but_marque1 > but_marque2 then
        points1 := 3;
        points2 := 0;
    elsif but_marque1 < but_marque2 then
        points1 := 0;
        points2 := 3;
    else
        points1 := 1;
        points2 := 1;
    end if;
    update classement set points = points + points1 where id_classement = id_equipe1;
    update classement set points = points + points2 where id_classement = id_equipe2;
    return new;
    end;
$$ language plpgsql;


create trigger nb_points 
after insert on match 
for each row execute procedure nb_points();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met à jour le nombre de cartons jaunes et rouges de chaque équipe à chaque fois qu'on insère un carton dans la table avertir. */

Create or replace function update_cartons() returns trigger as $$
declare
  vjoueur int;
  vcarton int;
  vequipe int;
begin
    select id_joueur, id_equipe, id_carton into vjoueur, vequipe, vcarton from avertir where id_equipe = new.id_equipe;
    if vcarton = 1 then
        update classement set carton_jaune = carton_jaune + 1 where id_classement = vequipe;
    else
        update classement set carton_rouge = carton_rouge + 1 where id_classement = vequipe;
    end if;
    return new;
    end;
$$ language plpgsql;

create trigger update_cartons
after insert on avertir
for each row execute procedure update_cartons();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui modifie la différence de buts dans le classement en fonction du résultat du match */

Create or replace function update_difference_buts() returns trigger as $$
declare
  vequipe1 int;
  vequipe2 int;
  vbut_domicile int;
  vbut_exterieur int;
  vdiff_buts1 int;
  vdiff_buts2 int;
begin
    select id_equipe_domicile, id_equipe_exterieur, score_equipe_domicile, score_equipe_exterieur into vequipe1, vequipe2, vbut_domicile, vbut_exterieur from match where id_match = new.id_match;

    select diff_but into vdiff_buts1 from classement where id_classement = vequipe1;
    select diff_but into vdiff_buts2 from classement where id_classement = vequipe2;

    update classement set diff_but = vdiff_buts1 + (vbut_domicile - vbut_exterieur) where id_classement = vequipe1;
    update classement set diff_but = vdiff_buts2 + (vbut_exterieur - vbut_domicile) where id_classement = vequipe2;
    return new;
    end;
$$ language plpgsql;

create trigger update_diff_but
after insert on match
for each row execute procedure update_difference_buts();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met un V ou un N ou un D dans la colonne forme en fonction du résultat du match */

Create or replace function update_forme() returns trigger as $$
declare
  vequipe1 int;
  vequipe2 int;
  vbut_domicile int;
  vbut_exterieur int;
  vforme1 varchar;
  vforme2 varchar;
begin
    select id_equipe_domicile, id_equipe_exterieur, score_equipe_domicile, score_equipe_exterieur into vequipe1, vequipe2, vbut_domicile, vbut_exterieur from match where id_match = new.id_match;

    select forme into vforme1 from classement where id_classement = vequipe1;
    select forme into vforme2 from classement where id_classement = vequipe2;

    if vbut_domicile > vbut_exterieur then
        update classement set forme = 'V' where id_classement = vequipe1;
        update classement set forme = 'D' where id_classement = vequipe2;
    elsif vbut_domicile < vbut_exterieur then
        update classement set forme = 'D' where id_classement = vequipe1;
        update classement set forme = 'V' where id_classement = vequipe2;
    else
        update classement set forme = 'N' where id_classement = vequipe1;
        update classement set forme = 'N' where id_classement = vequipe2;
    end if;
    return new;
    end;
$$ language plpgsql;

create trigger update_forme
after insert on match
for each row execute procedure update_forme();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met à jour le nombre de buts marqués et encaissés de chaque équipe à chaque fois qu'on insère un match dans la table match. */

Create or replace function update_marque_encaisse() returns trigger as $$
declare
  vequipe1 int;
  vequipe2 int;
  vbut_domicile int;
  vbut_exterieur int;
begin
    select id_equipe_domicile, id_equipe_exterieur, score_equipe_domicile, score_equipe_exterieur into vequipe1, vequipe2, vbut_domicile, vbut_exterieur from match where id_match = new.id_match;

    if vbut_domicile > vbut_exterieur then
        update classement set but_marque = but_marque + vbut_domicile where id_classement = vequipe1;
        update classement set but_marque = but_marque + vbut_exterieur where id_classement = vequipe2;
        update classement set but_encaisse = but_encaisse + vbut_exterieur where id_classement = vequipe1;
        update classement set but_encaisse = but_encaisse + vbut_domicile where id_classement = vequipe2;
    elsif vbut_domicile < vbut_exterieur then
        update classement set but_marque = but_marque + vbut_exterieur where id_classement = vequipe2;
        update classement set but_marque = but_marque + vbut_domicile where id_classement = vequipe1;
        update classement set but_encaisse = but_encaisse + vbut_domicile where id_classement = vequipe2;
        update classement set but_encaisse = but_encaisse + vbut_exterieur where id_classement = vequipe1;
    else
        update classement set but_marque = but_marque + vbut_domicile where id_classement = vequipe1;
        update classement set but_marque = but_marque + vbut_exterieur where id_classement = vequipe2;
        update classement set but_encaisse = but_encaisse + vbut_domicile where id_classement = vequipe1;
        update classement set but_encaisse = but_encaisse + vbut_exterieur where id_classement = vequipe2;
    end if;
    return new;
    end;
$$ language plpgsql;


create trigger update_marque_encaisse
after insert on match
for each row execute procedure update_marque_encaisse();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met à jour le nombre de matchs joués de chaque équipe à chaque fois qu'on insère un match dans la table match. */

Create or replace function update_nb_match_joue() returns trigger as $$
declare
  vequipe1 int;
  vequipe2 int;
begin
    select id_equipe_domicile, id_equipe_exterieur into vequipe1, vequipe2 from match where id_match = new.id_match;

    update classement set nb_matchs = nb_matchs + 1 where id_classement = vequipe1;
    update classement set nb_matchs = nb_matchs + 1 where id_classement = vequipe2;
    return new;
    end;
$$ language plpgsql;

create trigger update_nb_match_joue
after insert on match
for each row execute procedure update_nb_match_joue();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui met à jour le nombre de victoires, de défaites et de nuls de chaque équipe à chaque fois qu'on insère un match dans la table match. */

Create or replace function update_vnd() returns trigger as $$
declare
  vequipe1 int;
  vequipe2 int;
  vbut_domicile int;
  vbut_exterieur int;
begin
    select id_equipe_domicile, id_equipe_exterieur, score_equipe_domicile, score_equipe_exterieur into vequipe1, vequipe2, vbut_domicile, vbut_exterieur from match where id_match = new.id_match;
    if vbut_domicile > vbut_exterieur then
        update classement set nb_victoire = nb_victoire + 1 where id_classement = vequipe1;
        update classement set nb_defaite = nb_defaite + 1 where id_classement = vequipe2;
    elsif vbut_domicile < vbut_exterieur then
        update classement set nb_victoire = nb_victoire + 1 where id_classement = vequipe2;
        update classement set nb_defaite = nb_defaite + 1 where id_classement = vequipe1;
    else
        update classement set nb_match_nul = nb_match_nul + 1 where id_classement = vequipe1;
        update classement set nb_match_nul = nb_match_nul + 1 where id_classement = vequipe2;
    end if;
    return new;
    end;
$$ language plpgsql;


create trigger update_vnd
after insert on match
for each row execute procedure update_vnd();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui vérifie si le buteur a bien joué dans le match */

create or replace function verification_buteur_match() returns trigger as $$
declare
  vmatch int;
  vjoueur int;
    vdom int;
    vext int;
begin
    select id_match into vmatch from match as M where id_match = new.id_match;
    select id_joueur into vjoueur from joueur as J where id_joueur = new.id_joueur;
    select id_equipe_domicile into vdom from match where id_match = vmatch;
    select id_equipe_exterieur into vext from match where id_match = vmatch;
    if not exists (select * from joueur where id_joueur = vjoueur and id_equipe = vdom) and not exists (select * from joueur where id_joueur = vjoueur and id_equipe = vext) then
        raise exception 'Le joueur % n''a pas joué dans ce match', vjoueur ;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger verification_buteur_match
before insert on but
for each row
execute procedure verification_buteur_match();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Trigger qui permet de limiter le nombre de cartons jaunes et rouges reçus par un joueur lors d'un match */

create or replace function verification_nb_carton() returns trigger as $$
declare
  vmatch int;
  vjoueur int;
  vcarton_jaune int;
  vcarton_rouge int;
begin
    select id_match into vmatch from match as M where id_match = new.id_match;
    select id_joueur into vjoueur from joueur as J where id_joueur = new.id_joueur;
    select count(*) into vcarton_jaune from avertir where id_joueur = vjoueur and id_match = vmatch and id_carton = 1;
    select count(*) into vcarton_rouge from avertir where id_joueur = vjoueur and id_match = vmatch and id_carton = 2;
    if vcarton_jaune > 1 then
        raise exception 'Le joueur % a déjà reçu 2 cartons jaunes dans ce match', vjoueur ;
    elsif vcarton_rouge > 0 then
        raise exception 'Le joueur % a déjà reçu un carton rouge dans ce match', vjoueur ;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger verification_nb_carton
before insert on avertir
for each row
execute procedure verification_nb_carton();


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------- FONCTIONS -------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Fonction qui permet d'afficher le classement des buteurs */

Create or replace function affiche_classement_buteur() returns SETOF Classement_buteur as $$

    select ROW_NUMBER() OVER(ORDER BY but_marque DESC) As N° , nom_joueur as JOUEUR, but_marque as BUTS from classement_buteur limit 15;

$$ LANGUAGE SQL;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Fonction qui permet d'afficher le classement des équipes */

CREATE or REPLACE FUNCTION affiche_classement() RETURNS SETOF classement AS $$
    select ROW_NUMBER() OVER(ORDER BY points DESC, diff_but desc, carton_jaune desc, carton_rouge desc
	) As N° , nom_equipe, nb_matchs,points, diff_but, carton_jaune, carton_rouge, but_marque, but_encaisse,
	nb_victoire, nb_defaite, nb_match_nul, forme from classement;
$$ LANGUAGE SQL;