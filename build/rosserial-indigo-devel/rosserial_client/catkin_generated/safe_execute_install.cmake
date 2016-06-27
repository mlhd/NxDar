execute_process(COMMAND "/home/frank/Lidar/build/rosserial-indigo-devel/rosserial_client/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/frank/Lidar/build/rosserial-indigo-devel/rosserial_client/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
