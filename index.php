<?php
require_once('./includes/header.php');
require_once('./view/components/base.php');

?>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
        <meta name="viewport" content="width=device-width" />
        <meta name="generator" content={Astro.generator} />
        <title>Astro</title>
    </head>
    <body>
        <?php
            BaseComponent('
                <div class="mt-5 inline-flex flex-row">
                    <span class="text-3xl"> Please Login:</span>
                    <form action="app/login.php" method="post">
                        <input
                            name="user_type"
                            class="m-1 p-1 bg-slate-100 transition hover:bg-slate-200"
                            type="text"
                        />
                        <input
                            class="m-1 p-1 bg-slate-100 transition hover:bg-slate-200"
                            type="submit"
                        />
                    </form>
                </div>
            ');
        ?>
    </body>
</html>
