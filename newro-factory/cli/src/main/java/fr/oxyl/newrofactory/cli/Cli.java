package fr.oxyl.newrofactory.cli;

import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import fr.oxyl.newrofactory.service.QuestionService;

public final class Cli {

    private final QuestionService questionService;

    private boolean closeFlag;
    private final Scanner scanner = new Scanner(System.in);
    private final Logger LOGGER = LoggerFactory.getLogger(Cli.class);

    public Cli() {
        this.questionService = null;
        this.closeFlag = false;
    }

    public void run() {
        try (scanner) {
            System.out.println(welcome());
            while (!closeFlag) {
                System.out.print("newro-factory> ");
                String input = scanner.nextLine().trim();
                if (input.isEmpty()) {
                    continue;
                }
                String[] tokens = input.split(" ");
                parse(tokens);
            }
        }
    }

    private void parse(String[] tokens) {
        String command = tokens[0];
        switch (command) {
            case "-h" -> {
                processHelp();
            }
            case "-q" -> {
                processQuit();
            }
            case "-dq" -> {
                processDeleteQuestion(tokens);
            }
            default -> {
                System.out.println("Commande inconnue : " + command + ". Tapez -h pour l'aide.");
            }
        }
        ;
    }

    private String welcome() {
        return "Bienvenue sur le cmd Newro-Factory pour toute aide, tapez -h";
    }

    private String help() {
        return """
                Newro-Factory cmd vous permet d'utiliser les commandes suivantes (séparément) :

                -dq <id>            : supprimer la question avec l'identifiant <id>
                -h                  : Demander de l'aide
                -q                  : Quitter Newro-Factory
                """;
    }

    private void processHelp() {
        System.out.println(help());
    }

    private void processQuit() {
        closeFlag = true;
        System.out.println("Fermeture du cmd Newro-Factory...");
    }

    private void processDeleteQuestion(String[] tokens) {
        long id = checkAndParseId(tokens);
        if (id == -1L) {
            return;
        }
        questionService.deleteById(id);
        System.out.println("La question avec l'identifiant " + id + " a été supprimée.");
    }

    private long checkAndParseId(String[] tokens) {
        if (tokens.length != 2) {
            System.out.println("Commande incorrecte. Tapez -h pour l'aide.");
            return -1L;
        }
        try {
            return Long.parseLong(tokens[1]);
        } catch (NumberFormatException e) {
            System.out.println("L'identifiant de la question doit être un nombre.");
        }
        return -1L;
    }

}
