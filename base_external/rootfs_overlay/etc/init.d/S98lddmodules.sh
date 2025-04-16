
# This script is executed during system startup( with the "start as argumen
# and during shutdown (with stop as argument)


case "$1" in
	start)
		echo "S98Modules Start... "
		cd /lib/modules/$(uname -r)/extra
		scull_load
		echo "Loading Scull..."
		module_load faulty
		echo "Loading Faulty..."
		modprobe hello
		echo "Loading hello module..."
		;;
	stop)
		echo "S98Modules Stop...."
		cd /lib/modules/$(uname -r)/extra
		scull_unload
		echo "Unloading Scull..."
		module_unload faulty
		echo "Unloading faulty..."
		rmmod hello
		echo "Unloading Hello Module"
		;;
	*)
		echo "Usage: $0 {start|stop}"
		exit 1
		;;
esac

exit 0

