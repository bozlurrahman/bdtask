<div id="site_content">
    <div id="content">
      
        <div class="success-message" style="color: green;">
            <?php if(isset($success) && $success == 1) {echo "This post has been inserted";}?>
        </div>
        <!-- insert the page content here -->
        <h1>New Post</h1>
        <form id="new_post" action="<?=  base_url()?>index.php/blog/new_post/" method="post">
          <div class="form_settings">
            <p><span>Title</span><input class="" type="text" name="post_title" value="" /></p>
            <p><span>Description</span><textarea class="textarea" rows="15" cols="50" name="post"></textarea></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="add" value="Publish" /></p>
          </div>
        </form>
    </div>
</div>

<script>
    var ajax_url = "<?=  base_url()?>index.php/blog/new_post_ajax/";
</script>
