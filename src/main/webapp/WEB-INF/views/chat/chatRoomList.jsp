<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "chatHeader.jsp" %>
<!DOCTYPE html>
<html>
    <body>
        <!-- Layout -->
        <div class="layout overflow-hidden">
            <!-- Navigation -->
            <nav class="navigation d-flex flex-column text-center navbar navbar-light hide-scrollbar">
                <!-- Nav items -->
                <ul class="d-flex nav navbar-nav flex-row flex-xl-column flex-grow-1 justify-content-between justify-content-xl-center align-items-center w-100 py-4 py-lg-2 px-lg-3" role="tablist">
                    <!-- Invisible item to center nav vertically -->
                    <li class="nav-item d-none d-xl-block invisible flex-xl-grow-1">
                        <a class="nav-link py-0 py-lg-8" href="#" title="">
                            <div class="icon icon-xl">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </div>
                        </a>
                    </li>

                    <!-- Chats -->
                    <li class="nav-item">
                        <a class="nav-link active py-0 py-lg-8" id="tab-chats" href="#tab-content-chats" title="Chats" data-bs-toggle="tab" role="tab">
                            <div class="icon icon-xl icon-badged">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                <div class="badge badge-circle bg-primary">
                                    <span>4</span>
                                </div>
                            </div>
                        </a>
                    </li>
            </nav>

            <!-- Sidebar -->
            <aside class="sidebar bg-light">
                <div class="tab-content h-100" role="tablist">
                    <!-- Chats -->
                    <div class="tab-pane fade h-100 show active" id="tab-content-chats" role="tabpanel">
                        <div class="d-flex flex-column h-100 position-relative">
                            <div class="hide-scrollbar">

                                <div class="container py-8">
                                    <!-- Title -->
                                    <div class="mb-8">
                                        <h2 class="fw-bold m-0">Chats</h2>
                                    </div>

                                    <!-- Search -->
                                    <div class="mb-6">
                                        <form action="#">
                                            <div class="input-group">
                                                <div class="input-group-text">
                                                    <div class="icon icon-lg">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                                    </div>
                                                </div>

                                                <input type="text" class="form-control form-control-lg ps-0" placeholder="Search messages or users" aria-label="Search for messages or users...">
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Chats -->
                                    <div class="card-list">
                                        <!-- Card -->
                                        <a href="chatd" class="card border-0 text-reset">
                                            <div class="card-body">
                                                <div class="row gx-5">
                                                    <div class="col-auto">
                                                        <div class="avatar avatar-online">
                                                            <img src="resources/chat/assets/img/avatars/6.jpg" alt="#" class="avatar-img">
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <h5 class="me-auto mb-0">Ollie Chandler</h5>
                                                            <span class="text-muted extra-small ms-2">08:45 PM</span>
                                                        </div>

                                                        <div class="d-flex align-items-center">
                                                            <div class="line-clamp me-auto">
                                                                Hello! Yeah, I'm going to meet friend of mine at the departments stores now.
                                                            </div>

                                                            <div class="badge badge-circle bg-primary ms-5">
                                                                <span>3</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- .card-body -->
                                        </a>
                                        <!-- Card -->

                                        <!-- Card -->
                                        <a href="chat-empty.html" class="card border-0 text-reset">
                                            <div class="card-body">
                                                <div class="row gx-5">
                                                    <div class="col-auto">
                                                        <div class="avatar avatar-online">
                                                            <img src="resources/chat/assets/img/avatars/8.jpg" alt="#" class="avatar-img">
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <h5 class="me-auto mb-0">Elise Dennis</h5>
                                                            <span class="text-muted extra-small ms-2">08:35 PM</span>
                                                        </div>

                                                        <div class="d-flex align-items-center">
                                                            <div class="line-clamp me-auto">
                                                                is typing<span class='typing-dots'><span>.</span><span>.</span><span>.</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- .card-body -->
                                        </a>
                                        <!-- Card -->

                                        <!-- Card -->
                                        <a href="chat-direct.html" class="card border-0 text-reset">
                                            <div class="card-body">
                                                <div class="row gx-5">
                                                    <div class="col-auto">
                                                        <div class="avatar">
                                                            <img src="resources/chat/assets/img/avatars/4.jpg" alt="#" class="avatar-img">
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <h5 class="me-auto mb-0">Warren White</h5>
                                                            <span class="text-muted extra-small ms-2">06:20 PM</span>
                                                        </div>

                                                        <div class="d-flex align-items-center">
                                                            <div class="line-clamp me-auto">
                                                                Hello! Yeah, I'm going to meet my friend of mine at the departments stores as soon as possible.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- .card-body -->
                                        </a>
                                        <!-- Card -->

                                        <!-- Card -->
                                        <a href="chat-direct.html" class="card border-0 text-reset">
                                            <div class="card-body">
                                                <div class="row gx-5">
                                                    <div class="col-auto">
                                                        <div class="avatar">
                                                            <img src="resources/chat/assets/img/avatars/11.jpg" alt="#" class="avatar-img">
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <div class="d-flex align-items-center mb-3">
                                                            <h5 class="me-auto mb-0">Mila White</h5>
                                                            <span class="text-muted extra-small ms-2">04:40 PM</span>
                                                        </div>

                                                        <div class="d-flex align-items-center">
                                                            <div class="line-clamp me-auto">
                                                                Hello! Yeah, I'm going to meet my friend of mine at the departments stores as soon as possible.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- .card-body -->
                                        </a>
                                        <!-- Card -->
                                    </div>
                                    <!-- Chats -->
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </aside>
            <!-- Sidebar -->

            <!-- Chat -->
            <main class="main">
                <div class="container h-100">

                    <div class="d-flex flex-column h-100 justify-content-center text-center">
                        <div class="mb-6">
                            <span class="icon icon-xl text-muted">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                            </span>
                        </div>

                        <p class="text-muted">Pick a person from left menu, <br> and start your conversation.</p>
                    </div>

                </div>
            </main>
        </div>
    </body>
</html>