#include <ros/ros.h>
#include <ros/topic_manager.h>
#include <memory>
#include <test/Empty.h>
#include <test/IntMsg.h>

class Singleton {
 private:

  // Singleton instance
  static std::unique_ptr<Singleton> instance_;

  ros::TopicManagerPtr ptr;
  ros::NodeHandle node_handle_;
  ros::ServiceServer service_server_;
  ros::Subscriber int_subscriber_;

  Singleton(const ros::NodeHandle &node_handle){
    node_handle_ = node_handle;

    // If this is uncommented ServiceManager::unadvertiseService will fail with:
    // void boost::recursive_mutex::lock(): Assertion `!pthread_mutex_lock(&m)' failed.
    //service_server_ = node_handle_.advertiseService("reinitialize_mode_control",
    //                                                        &Singleton::ServiceCallback,
    //                                                        this);

    // If this is uncommented TopicManager::unsubscribe will fail with:
    // terminate called after throwing an instance of 'boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<boost::lock_error> >'
    // what():  boost: mutex lock failed in pthread_mutex_lock: Invalid argument
    int_subscriber_ = node_handle_.subscribe("int_topic", 1000, &Singleton::IntCallback, this);
  }

  bool ServiceCallback(test::Empty::Request &req, test::Empty::Response &rep){
    std::cout << "service" << std::endl;
  }

  void IntCallback(const test::IntMsg &msg){
    std::cout << "Message" << std::endl;
  }

 public:
  static void InitializeSingleton(const ros::NodeHandle& nodeHandle){
    Singleton::instance_ = std::unique_ptr<Singleton>(new Singleton(nodeHandle));
  }


  static Singleton* GetInstance(){
    return Singleton::instance_.get();
  }

  ~Singleton(){
    std::cout<< "Destroying singleton" << std::endl;
  };

};


std::unique_ptr<Singleton> Singleton::instance_ = nullptr;

void _mainLoop() {
}

int main(int argc, char **argv) {

  ros::init(argc, argv, "test_node");

  ros::NodeHandle nodeHandle;

  Singleton::InitializeSingleton(nodeHandle);

  ros::spin();

  return 0;
}
