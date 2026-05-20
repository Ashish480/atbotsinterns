#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

class AtbotsSubscriber : public rclcpp::Node
{
public:
    AtbotsSubscriber() : Node("atbots_subscriber")
    {
        subscription_ = this->create_subscription<std_msgs::msg::String>(
            "atbots_topic",
            10,
            std::bind(&AtbotsSubscriber::topic_callback, this, std::placeholders::_1));

        RCLCPP_INFO(this->get_logger(), "Subscriber started...");
    }

private:
    void topic_callback(const std_msgs::msg::String::SharedPtr msg)
    {
        RCLCPP_INFO(
            this->get_logger(),
            "I have received the message: '%s'",
            msg->data.c_str());
    }

    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;
};

int main(int argc, char * argv[])
{
    rclcpp::init(argc, argv);

    rclcpp::spin(std::make_shared<AtbotsSubscriber>());

    rclcpp::shutdown();
    return 0;
}
