<?php

class Blog extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('m_db');
    }

    function index($start = 0)//index page
    {
        $data['posts'] = $this->m_db->get_posts(5, $start);

        //pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url() . 'index.php/blog/index/';//url to set pagination
        $config['total_rows'] = $this->m_db->get_post_count();
        $config['per_page'] = 5;
        $this->pagination->initialize($config);
        $data['pages'] = $this->pagination->create_links(); //Links of pages

        // echo "<pre>";
        // var_dump($data['posts'][0]);
        // echo "</pre>";

        $class_name = array('home_class' => 'current', 'login_class' => '', 'register_class' => '', 'upload_class' => '', 'contact_class' => '');
        $this->load->view('header', $class_name);
        $this->load->view('v_home', $data);
        $this->load->view('footer');
    }

    function search($query = '')//index page
    {

        $query = $query != '' ? $query : $this->input->get('query', TRUE);

        $data['posts'] = $this->m_db->search_posts($query);

        //pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url() . 'blog/search/?query=' . urlencode($query);//url to set pagination
        $config['total_rows'] = $this->m_db->get_post_count();
        $config['per_page'] = 5;
        $this->pagination->initialize($config);
        $data['pages'] = $this->pagination->create_links(); //Links of pages
        $data['query'] = $query; //Links of pages

        $class_name = array('home_class' => 'current', 'login_class' => '', 'register_class' => '', 'upload_class' => '', 'contact_class' => '');
        $this->load->view('header', $class_name);
        $this->load->view('v_search', $data);
        $this->load->view('footer');
    }

    function post($post_id)//single post page
    {
        $this->load->model('m_comment');
        $data['comments'] = $this->m_comment->get_comment($post_id);
        $data['post'] = $this->m_db->get_post($post_id);
        $class_name = ['home_class' => 'current', 'login_class' => '', 'register_class' => '', 'upload_class' => '', 'contact_class' => ''];
        $this->load->view('header', $class_name);
        $this->load->view('v_single_post', $data);
        $this->load->view('footer');
    }

    function new_post_ajax()//Creating new post page
    {
        $data['success'] = 0;
        //when the user is not an admin and author
        if (!$this->check_permissions('author'))
        {
            redirect(base_url() . 'index.php/users/login');
        }
        if ($this->input->post()) {
            $user_id = $this->session->userdata('user_id');
            $data = array('post_title' => $this->input->post('post_title'), 'post' => $this->input->post('post'), 'user_id' => $user_id, 'active' => 1,);
            $data['success'] = $this->m_db->insert_post($data);
            // redirect(base_url() . 'index.php/blog/');
        }

        echo json_encode($data);
        die();
    }

    function new_post()//Creating new post page
    {
        //when the user is not an admin and author
        if (!$this->check_permissions('author'))
        {
            redirect(base_url() . 'index.php/users/login');
        }
        if ($this->input->post()) {
            $user_id = $this->session->userdata('user_id');
            $data = array('post_title' => $this->input->post('post_title'), 'post' => $this->input->post('post'), 'user_id' => $user_id, 'active' => 1,);
            $this->m_db->insert_post($data);
            redirect(base_url() . 'index.php/blog/');
        } else {

            $class_name = ['home_class' => 'current', 'login_class' => '', 'register_class' => '', 'upload_class' => '', 'contact_class' => ''];
            $this->load->view('header', $class_name);
            $this->load->view('v_new_post');
            $this->load->view('footer');
        }
    }

    function check_permissions($required)//checking current user's permission
    {
        $user_type = $this->session->userdata('user_type');//current user
        if ($required == 'user') {
            return isset($user);

        } elseif ($required == 'author') {
            return $user_type == 'author' || $user_type == 'admin';

        } elseif ($required == 'admin') {
            return $user_type == 'admin';
        }
    }

    function editpostajax($post_id)//Edit post page
    {
        if (!$this->check_permissions('author'))//when the user is not an admin and author
        {
            redirect(base_url() . 'index.php/users/login');
        }
        $data['success'] = 0;

        if ($this->input->post()) {
            $data['img'] = $this->upload_file();
            $data = array('post_title' => $this->input->post('post_title'), 'post' => $this->input->post('post'), 'img' => json_encode($data['img']), 'active' => 1);
            $this->m_db->update_post($post_id, $data);

            $data['success'] = 1;
        }
        $data['post'] = $this->m_db->get_post($post_id);
        echo json_encode($data);
        die();

    }

    
    function upload_file() {
        // $config['upload_path'] = FCPATH . 'uploads/';
        $config['upload_path'] = 'public/uploads/';
        // echo $config['upload_path'];
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '2048'; //in KB
        $config['max_width'] = '1024'; //in px
        $config['max_height'] = '768'; //in px

        $this->load->library('upload', $config);

        $data = array();
        
        if (!$this->upload->do_upload('img')) {//If there is error when uploading file
            $data['error'] = array('error' => $this->upload->display_errors());
        } else {
            $data['upload_data'] = $this->upload->data();

            //RESIZE IMAGE if you want(optional)
            // $this->resize($data['upload_data']['full_path'], $data['upload_data']['file_name']);
        }
        return  $data;
    }

    function resize($path, $file) {//Resizing a file;
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path;
        $config['create_thumb'] = TRUE;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = '200';
        $config['height'] = '200';
        $config['new_image'] = './uploads/' . $file;
        $this->load->library('image_lib', $config);
        $this->image_lib->resize();
    }

    function editpost($post_id)//Edit post page
    {
        if (!$this->check_permissions('author'))//when the user is not an admin and author
        {
            redirect(base_url() . 'index.php/users/login');
        }
        $data['success'] = 0;

        if ($this->input->post()) {
            $data = array('post_title' => $this->input->post('post_title'), 'post' => $this->input->post('post'), 'active' => 1);
            $this->m_db->update_post($post_id, $data);
            $data['success'] = 1;
        }
        $data['post'] = $this->m_db->get_post($post_id);

        $class_name = ['home_class' => 'current', 'login_class' => '', 'register_class' => '', 'upload_class' => '', 'contact_class' => ''];
        $this->load->view('header', $class_name);
        $this->load->view('v_edit_post', $data);
        $this->load->view('footer');
    }

    function deletepost($post_id)//delete post page
    {
        if (!$this->check_permissions('author'))//when the user is not an andmin and author
        {
            redirect(base_url() . 'index.php/users/login');
        }
        $this->m_db->delete_post($post_id);
        redirect(base_url() . 'index.php/blog/');
    }
}