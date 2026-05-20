#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist


class SquareTurtle(Node):

    def __init__(self):
        super().__init__('square_turtle')

        self.publisher_ = self.create_publisher(
            Twist,
            '/turtle1/cmd_vel',
            10
        )

        self.timer = self.create_timer(0.1, self.move_square)

        self.state = "forward"
        self.start_time = self.get_clock().now()

    def move_square(self):
        msg = Twist()

        elapsed = (
            self.get_clock().now() - self.start_time
        ).nanoseconds / 1e9

        if self.state == "forward":
            msg.linear.x = 2.0
            msg.angular.z = 0.0

            if elapsed >= 2.0:
                self.state = "turn"
                self.start_time = self.get_clock().now()

        elif self.state == "turn":
            msg.linear.x = 0.0
            msg.angular.z = 1.57

            if elapsed >= 1.0:
                self.state = "forward"
                self.start_time = self.get_clock().now()

        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)

    node = SquareTurtle()

    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass

    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
