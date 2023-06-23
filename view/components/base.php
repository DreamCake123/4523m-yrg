<?php
function BaseComponent($children) {
    ?>
    <div class="m-10">
        <h1 class="text-5xl">Yummy Restaurant Group</h1>
        <?php
            echo $children;
        ?>
    </div>
    <?php
}

?>