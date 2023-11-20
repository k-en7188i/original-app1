document.addEventListener('turbolinks:load', function() {
    const adultPrice = 1000; // 大人の料金
    const childPrice = 500;  // 子供の料金

    function increment(type) {
        adjustCount(type, 1);
    }

    function decrement(type) {
        adjustCount(type, -1);
    }

    function adjustCount(type, amount) {
        let countElement = document.getElementById(`${type}-count`);
        let currentCount = parseInt(countElement.value);
        let newCount = currentCount + amount;

        if (newCount >= 0) {
            countElement.value = newCount;
            updateTotal();
        }
    }

    function updateTotal() {
        const adultCount = parseInt(document.getElementById('adult-count').value);
        const childCount = parseInt(document.getElementById('child-count').value);
        
        const totalCount = adultCount + childCount;
        const totalPrice = (adultCount * adultPrice) + (childCount * childPrice);
        
        document.getElementById('total-count').innerText = totalCount;
        document.getElementById('total-price').innerText = totalPrice;
    }

    document.getElementById('increment-adult').addEventListener('click', function() {
        increment('adult');
    });

    document.getElementById('decrement-adult').addEventListener('click', function() {
        decrement('adult');
    });

    document.getElementById('increment-child').addEventListener('click', function() {
        increment('child');
    });

    document.getElementById('decrement-child').addEventListener('click', function() {
        decrement('child');
    });
});
