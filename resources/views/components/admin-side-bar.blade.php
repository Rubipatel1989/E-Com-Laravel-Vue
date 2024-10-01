<div class="sidebar-wrapper" data-simplebar="true">
	<div class="sidebar-header">
		<div>
			<img src="{{asset('assets/images/logo-icon.png')}}" class="logo-icon" alt="logo icon">
		</div>
		<div>
			<h4 class="logo-text" onclick="pos5_success_noti()">{{ Auth::User()->name }}</h4>
		</div>
		<div class="toggle-icon ms-auto"><i class='bx bx-arrow-to-left'></i>
		</div>
	</div>
	<!--navigation-->
	<ul class="metismenu" id="menu">
		<li>
			<a href="{{ url('admin/dashboard') }}" class="has-arrow">
				<div class="parent-icon"><i class='bx bx-home-circle'></i>
				</div>
				<div class="menu-title">Dashboard</div>
			</a>
		</li>

		<li class="menu-label">Home</li>
		<li>
			<a href="{{ url('admin/home_banner') }}">
				<div class="parent-icon"><i class='bx bx-cookie'></i>
				</div>
				<div class="menu-title">Home Banner</div>
			</a>
		</li>
		<li>
			<a href="{{ url('admin/manage_size') }}">
				<div class="parent-icon"><i class='bx bx-cookie'></i>
				</div>
				<div class="menu-title">Manage Size</div>
			</a>
		</li>
		<li>
			<a href="{{ url('admin/manage_color') }}">
				<div class="parent-icon"><i class='bx bx-cookie'></i>
				</div>
				<div class="menu-title">Manage Color</div>
			</a>
		</li>		
		<li>
			<a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class='bx bx-cart'></i>
				</div>
				<div class="menu-title">Attributes</div>
			</a>
			<ul>
				<li> <a href="{{ url('admin/attribute_name') }}"><i class="bx bx-right-arrow-alt"></i>Attribute Name</a></li>
				<li> <a href="{{ url('admin/attribute_value') }}"><i class="bx bx-right-arrow-alt"></i>Attribute Value</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:;" class="has-arrow">
				<div class="parent-icon"><i class='bx bx-cart'></i>
				</div>
				<div class="menu-title">Category</div>
			</a>
			<ul>
				<li> <a href="{{ url('admin/manage_category') }}"><i class="bx bx-right-arrow-alt"></i>Category</a></li>
				<li> <a href="{{ url('admin/category_attribute') }}"><i class="bx bx-right-arrow-alt"></i>Category Attribute</a></li>
			</ul>
		</li>



		<li class="menu-label">Pages</li>
		<li>
			<a class="has-arrow" href="javascript:;">
				<div class="parent-icon"><i class="bx bx-lock"></i>
				</div>
				<div class="menu-title">Authentication</div>
			</a>
			<ul>
				<li> <a href="authentication-signin.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Sign In</a>
				</li>
				<li> <a href="authentication-signup.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Sign Up</a>
				</li>
				<li> <a href="authentication-signin-with-header-footer.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Sign In with Header & Footer</a>
				</li>
				<li> <a href="authentication-signup-with-header-footer.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Sign Up with Header & Footer</a>
				</li>
				<li> <a href="authentication-forgot-password.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Forgot Password</a>
				</li>
				<li> <a href="authentication-reset-password.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Reset Password</a>
				</li>
				<li> <a href="authentication-lock-screen.html" target="_blank"><i class="bx bx-right-arrow-alt"></i>Lock Screen</a>
				</li>
			</ul>
		</li>
		<li>
			<a href="{{ url('admin/profile') }}">
				<div class="parent-icon"><i class="bx bx-user-circle"></i>
				</div>
				<div class="menu-title">User Profile</div>
			</a>
		</li>
	</ul>
	<!--end navigation-->
</div>