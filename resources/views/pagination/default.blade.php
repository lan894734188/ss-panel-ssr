<ul class="pagination  no-margin pull-right">
    {{-- 首页 --}}
    @if ($paginator->onFirstPage())
    <li class="disabled">
        <span>首页</span>
    </li>
    @else
    <li>
        <a href="{{ $paginator->url(1) . '&limit=' . $paginator->perPage() }}">首页</a>
    </li>
    @endif

    {{-- 上一页 --}}
    @if ($paginator->onFirstPage())
    <li class="disabled">
        <span>上一页</span>
    </li>
    @else
    <li>
        <a href="{{ $paginator->previousPageUrl() . '&limit=' . $paginator->perPage() }}">上一页</a>
    </li>
    @endif

    {{-- Pagination Elements --}}
    @foreach ($elements as $element)
    <!-- "Three Dots" Separator -->
    @if (is_string($element))
    <li class="disabled"><span>{{ $element }}</span></li>
    @endif

    <!-- Array Of Links -->
    @if (is_array($element))
    @foreach ($element as $page => $url)
    @if ($page == $paginator->currentPage())
    <li class="active"><span>{{ $page }}</span></li>
    @else
    <li><a href="{{ $url . '&limit=' . $paginator->perPage() }}">{{ $page }}</a></li>
    @endif
    @endforeach
    @endif
    @endforeach

    {{-- 下一页 --}}
    @if ($paginator->hasMorePages())
    <li>
        <a href="{{ $paginator->nextPageUrl() . '&limit=' . $paginator->perPage() }}">下一页</a>
    </li>
    @else
    <li class="disabled">
        <span>下一页</span>
    </li>
    @endif

    {{-- 尾页 --}}
    @if ($paginator->hasMorePages())
    <li>
        <a href="{{ $paginator->url($paginator->lastPage()) . '&limit=' . $paginator->perPage() }}">尾页</a>
    </li>
    @else
    <li class="disabled">
        <span>尾页</span>
    </li>
    @endif
</ul>
<ul class="clearfix"></ul>

{{-- 增加输入框，跳转任意页码和显示任意条数 --}}
<ul class="pagination pagination-sm no-margin no-padding pull-right">
    <li>
        <span data-toggle="tooltip" data-placement="bottom" title="输入页码，按回车快速跳转">
    第 <input type="text" class="text-center no-padding" value="{{ $paginator->currentPage() }}" id="customPage" data-total-page="{{ $paginator->lastPage() }}" style="width: 50px;"> 页 / 共 {{ $paginator->lastPage() }} 页
</span>
    </li>
    <li>
        <span data-toggle="tooltip" data-placement="bottom" title="输入每页条数，按回车快速跳转">
    每页 <input type="text" class="text-center no-padding" value="{{ $paginator->perPage() }}" id="customLimit" data-total="{{ $paginator->total() }}" style="width: 50px;"> 条 / 共 {{ $paginator->total() }} 条
</span>
    </li>
</ul>